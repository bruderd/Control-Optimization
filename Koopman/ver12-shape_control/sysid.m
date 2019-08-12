classdef sysid
    %sysid: Class for doing Koopman-based sysid
    %   Constructed from a sample set of data from an experiment or simulation.
    
    properties
        params struct;  % sysid parameters
        lift struct;    % contains matlab generated lifting functions
        basis struct;   % contains the observables for the system
    end
    
    methods
        function obj = sysid( data , varargin )
            %sysid: Construct an instance of this class
            %   data - struct with fields t,x,u,y. Contains results of a
            %   simuation or experiment of the system to be identified
            %   (note: this is not necessarily the same data to be used for
            %   sysid, it just provides the dimensions of the state, input,
            %   etc.)
            
            obj.params = struct;    % initialize params struct
            obj.params.n = size( data.y , 2 );  % dimension of measured state
            obj.params.m = size( data.u , 2 );  % dimension of input
            obj.params.Ts = mean( data.t(2:end) - data.t(1:end-1) );    % sampling time
            obj.params.nd = 1;  % number of delays (defaults to 1) 
            
            % load in system parameters if any are provided
            if length(varargin) == 1
                obj.params.sysParams = varargin{1};
            end
            
            obj.lift = struct;  % initialize lift struct
            obj.basis = struct; % initialize basis struct
        end
        
        % resample (resamples data with a desired time step)
        function data_resampled = resample( obj , data , Ts )
            % get query points
            tq = ( data.t(1) : Ts : data.t(end) )';
            
            data_resampled.t = tq;
            data_resampled.x = interp1( data.t , data.x , tq );
            data_resampled.u = interp1( data.t , data.u , tq );
            data_resampled.y = interp1( data.t , data.y , tq );
        end
        
        %% defining observables
        
        % def_observables (define the basis of observable functions)
        function obj = def_observables( obj , type , degree )
            % def_observables: Defines the set of nonlinear observable
            % functions that will act as basis of Koopman subspace
            %   type - Type of functions, [cell array of strings].
            %       'armshape' - coefficients of shape polynomial
            %       'poly'  - monomials
            %       ... more to be added over time
            %   degree - Maximum degree/complexity of functions, [vector].
            
            % check that the type and degree have same dimension
            if size(type) ~= size(degree)
                error('inputs must be of the same size');
            end
            
            % define the low dimensional state with delays, called zeta
            x = sym('x', [obj.params.n, 1] , 'real');   % state variable x
            xd = sym('xd', [obj.params.nd * obj.params.n, 1] , 'real');   % state delays i.e. for 2 delays: [x_i-1, x_i-2]'
            ud = sym('ud', [obj.params.nd * obj.params.m, 1] , 'real');   % input delays i.e. for 2 delays: [u_i-1, u_i-2]'
            zeta = [x ; xd; ud];    % state variable with delays
            u = sym('u', [obj.params.m, 1] , 'real');   % input vector u
            obj.params.zeta = zeta;
            
            % construct the observables
            fullBasis = [];
            for i = 1 : length(degree)
                if strcmp( type{i} , 'armshape' )
                    obj = obj.def_armshapeLift( degree(i) );
                    fullBasis = [ fullBasis ; obj.basis.armshape ];
                elseif strcmp( type{i} , 'poly' )
                    obj = obj.def_polyLift( degree(i) );
                    fullBasis = [ fullBasis ; obj.basis.poly ];
                end
            end
            
            % define outputs
            obj.basis.full = fullBasis;
            obj.lift.full = matlabFunction( fullBasis , 'Vars' , {zeta} );
        end
        
        % def_polyLift (defines polynomial basis functions)
        function obj = def_polyLift( obj , degree )
            %def_polyLift: Defines the lifting function that lifts state variable x to
            % space spanned by monomials with total degree less than or equal to
            % max_degree.
            %   e.g. 1 x1 x2 x1^2 x1x2 x2^2 ...
            
            zeta = obj.params.zeta; % get the symbolic unlifted state
            nzeta = length(zeta);
            maxDegree = degree;
            
            % Number of mononials, i.e. dimenstion of p(x)
            N = factorial(nzeta + maxDegree) / ( factorial(nzeta) * factorial(maxDegree) );
            
            % matrix of exponents (N x naug). Each row gives exponents for 1 monomial
            exponents = [];
            for i = 1:maxDegree
                exponents = [exponents; partitions(i, ones(1,nzeta))];
            end
            exponents = [exponents ; zeros(1,nzeta)];   % put constant at end of basis so state can be the first nzeta elements
            
            % create vector of orderd monomials (column vector)
            for i = 1:N
                polyBasis(i,1) = obj.get_monomial(zeta, exponents(i,:));
            end
            
%             % define matrix of exponents: columns=monomial term, rows=dimension of x
%             psi = exponents';
            
            % create the lifting function: zeta -> p(zeta)
            obj.lift.poly = matlabFunction(polyBasis, 'Vars', {zeta});
%             
%             % define derivative of lifted state with respect to x
%             dlift = jacobian(polyBasis,x);
%             matlabFunction(dlift, 'File', 'jacobianLift', 'Vars', {zeta});
            
            % output variables
            obj.basis.poly = polyBasis;    % symbolic vector of basis monomials, p(x)
%             ams.jacobianBasis = dlift;
%             params.N = N;   % dimension of polyBasis (including the state itself)
%             params.Np = N + p; % dimension of the lifted state
%             params.psi = psi;   % monomial exponent index function
%             params.x = x;   % symbolic state variable
%             params.u = u;   % symbolic input variable
%             params.xd = xd; % symbolic state delays
%             params.ud = ud; % symbolic input delays
            
        end
        
        % get_monomial (builds a monomial)
        function [ monomial ] = get_monomial( obj, x, exponents )
            %get_monomial: builds a monomial from symbolic vector x and a vector of
            %exponents
            %   e.g. x = [x1 x2]; exponents = [1 2]; =>  monomial = x1^1 * x2^2
            
            n = length(x);
            
            monomial = x(1)^exponents(1);
            for i = 2:n
                monomial = monomial * x(i)^exponents(i);
            end
        end
            
        % def_armshapeLift (defines the basis functions that describe the shape of robot arm)
        function obj = def_armshapeLift( obj , degree )
            
            % 2D case (will deal with the 3D case later)
            if ( ( obj.params.n-2 ) / obj.params.sysParams.Nmods ) == 2
                
                % define symbolic parameters
                zeta = obj.params.zeta;
                x = zeta( 1 : 2 : obj.params.n - 3 );   % x-coordinates of markers
                y = zeta( 2 : 2 : obj.params.n - 2 );    % y-coordinates of markers
                orient = zeta( obj.params.n-1 : obj.params.n );   % unit vector pointin in direction of end effector
                
                % define intermediate variables
                points = [ x , y ]; % matrix of marker coordinates. Each row is coords of a marker
                positions = obj.params.sysParams.markerPos(2:end); % row vector of marker positions [0,1]
                
                % generate virtual points to provide slope constraint at the base & end
                startpoint = [ 0 , 1e-2 ];
                endpoint = ( orient' )*1e-2 + points(end,:);    % add point extended from last link
                points_supp = [0 , 0 ; startpoint ; points ; endpoint];
                
                % generate A matrix for least squares problem
                positions_supp = [ 0 , 1e-2 , positions , 1+1e-2 ];
                A = zeros( length(positions_supp) , degree );
                for i = 1 : degree
                    A(:,i) = reshape( positions_supp , [] , 1) .^ i;
                end
                
                % separate x and y corrdinates of points
                points_x = points_supp(:,1);
                points_y = points_supp(:,2);
                
                % find polynomial coefficients
                obs_matrix = pinv(A);
                coeffs_vec_x = obs_matrix * points_x;
                coeffs_vec_y = obs_matrix * points_y;
                
                % define output
                armshapeBasis = [coeffs_vec_x ; coeffs_vec_y ];
                obj.basis.armshape = armshapeBasis;
                
                % create the lifting function: zeta -> p(zeta)
                obj.lift.armshape = matlabFunction(armshapeBasis, 'Vars', {zeta});
            else
                error('Number of marker postions must be number of modules (for now)');
            end
        end
        
        %% fitting Koopman operator and A,B,C system matrices
        
        % get_zeta (adds a zeta field to a test data struct)
        function data_out = get_zeta( obj , data_in )
            %get_zeta: Adds a zeta field to a test data struct
            %   data_in - struct with t , x , y , u fields
            %   zeta - [ y , yd1 , yd2 , ... , ud1 , ud2 , ... ]
            
            data_out = data_in;
            
            % add the zeta field
            for i = obj.params.nd + 1 : length( data_in.t )
                ind = i - obj.params.nd;    % current timestep index
                y = data_in.y( i , : );
                ydel = zeros( 1 , obj.params.nd * obj.params.n );
                udel = zeros( 1 , obj.params.nd * obj.params.m );
                for j = 1 : obj.params.nd
                    fillrange_y = obj.params.n * (j - 1) + 1 : obj.params.n * j;
                    fillrange_u = obj.params.m * (j - 1) + 1 : obj.params.m * j;
                    ydel(1 , fillrange_y) = data_in.y( i - j , : );
                    udel(1 , fillrange_u) = data_in.u( i - j , : );
                end
                zeta = [ y , ydel , udel ];
                data_out.zeta( ind , : ) = zeta;
                data_out.uzeta( ind , : ) = data_in.u( i , : );    % current timestep with zeta (input starting at current timestep)
            end
        end
        
        % get_snapshotPairs (convert time-series data into snapshot pairs)
        function snapshotPairs = get_snapshotPairs( obj , data , varargin )
            %get_snapshotPairs: Convert time-series data into a set of num
            %snapshot pairs.
            %   data - struct with fields x , y , u , t , zeta
            %   varargin = num - number of snapshot pairs to be taken
            
            % set the number of snapshot pairs to be taken
            num_max = size( data.zeta , 1 ) - 1; % maximum number of snapshot pairs
            if length(varargin) == 1
                num = varargin{1};
                if num > num_max - 1
                    message = [ 'Number of snapshot pairs cannot exceed ' , num2str(num_max) , '. Taking ' , num2str(num_max) , ' pairs instead.' ];
                    disp(message);
                    num = num_max;
                end
            else
                num = num_max;
            end
            
            % separate data into 'before' and 'after' time step
            before.zeta = data.zeta( 1:end-1 , : );
            after.zeta = data.zeta( 2:end , : );
            u = data.uzeta( 1:end-1 , : );    % input that happens between before.zeta and after.zeta
            
            % randomly select num snapshot pairs
            total = num_max;
            s = RandStream('mlfg6331_64'); 
            index = datasample(s , 1:total, num , 'Replace' , false);
            
            snapshotPairs.zeta_pre = before.zeta( index , : ); 
            snapshotPairs.zeta_post = after.zeta( index , : );
            snapshotPairs.u = u( index , : );
            
        end
        
        
    end
end
























