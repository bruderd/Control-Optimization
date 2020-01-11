classdef data
    %data: This class stores function that can be used to mess with
    %experimental and simulated data files with fields t , y , u , (x) ,...
    %   Detailed explanation goes here
    
    properties
        Property1
    end
    
    methods
        function obj = data(varargin)
            %data: Construct an instance of this class
            %   Detailed explanation goes here
%             obj.Property1 = inputArg1 + inputArg2;
        end
    end
   
    methods(Static) 
        
        % resample (resamples data with a desired time step)
        function data_resampled = resample( data , Ts )
            %resample: resamples sim/exp data with a desired timestep
            %   data - struct with fields t, y, x (optional)
            %   Ts - the desired sampling period
            
            % get query points
            tq = ( data.t(1) : Ts : data.t(end) )';
            
            data_resampled.t = tq;
            data_resampled.u = interp1( data.t , data.u , tq );
            data_resampled.y = interp1( data.t , data.y , tq );
            if ismember( 'x' , fields(data) )
                data_resampled.x = interp1( data.t , data.x , tq );
            end
        end
        
        % chop (chop data into several trials)
        function data_chopped = chop( data , num , len )
            %chop: chop data into num trials of lenght len
            %   data - struct with fields t , y , (x)
            %   data_chopped - cell array containing the chopped datas
            
            % determine length of timestep
            Ts = mean( data.t(2:end) - data.t(1:end-1) ); % take mean in case they're not quite uniform
            
            % find maximum length of each chop for given num
            maxlen = data.t(end) / num;
            if len > maxlen
                len = maxlen;
                disp([ 'Maximum trial length is ' , num2str(maxlen) , 's. Using this value instead.' ]);
            end
            
            % set length of the chops in terms of time steps
            lenk = length( find( data.t < len ) );
            maxlenk = length( find( data.t < maxlen ) );
            
            data_chopped = cell( 1 , num );
            for i = 1 : num
                index = (i-1) * maxlenk + ( 1 : lenk );
                
                % chop the data
                data_chopped{i}.t = ( ( 1 : lenk ) - 1 ) * Ts;
                data_chopped{i}.y = data.y( index , : );
                data_chopped{i}.u = data.u( index , : );
                if ismember( 'x' , fields(data) )
                    data_chopped{i}.x = data.x( index , : );
                end
            end 
        end
        
        % partition (cut data into two non-overlapping trials)
        function [ part1 , part2 ] = partition( data_in , len )
            %partition (cut data into two non-overlapping trials)
            %   data_in - struct with fields t , y , (x)
            %   part1 - all data except that in part2
            %   part2 - data of length 'len' in seconds
            
            % determine length of timestep
            Ts = mean( data_in.t(2:end) - data_in.t(1:end-1) ); % take mean in case they're not quite uniform
            
            % find maximum length of part2
            maxlen = data_in.t(end);
            if len > maxlen
                len = maxlen;
                disp([ 'Maximum trial length is ' , num2str(maxlen) , 's. Using this value instead.' ]);
            end
            
            % find the cutoff index between partitions
            index = length( data_in.t ) - length( find( data_in.t < len ) );
            
            % create partitions
            part1.t = data_in.t( 1 : index ) - data_in.t( 1 );
            part1.y = data_in.y( 1 : index , : );
            part1.u = data_in.u( 1 : index , : );
          
            
            part2.t = data_in.t( index+1 : end ) - data_in.t( index+1 );
            part2.y = data_in.y( index+1 : end , : );
            part2.u = data_in.u( index+1 : end , : );
            
            % if state (x) or load (w) fields are there, include them
            if ismember( 'x' , fields(data_in) )
                part1.x = data_in.x( 1 : index , : );
                part2.x = data_in.x( index+1 : end , : );
            end
            if ismember( 'w' , fields(data_in) )
                part1.w = data_in.w( 1 : index , : );
                part2.w = data_in.w( index+1 : end , : );
            end
        end
        
        % merge (merge several data files into single file)
        function data_merged = merge_files
            %merge_files: Merge several data files into single file
            %   data_merged: cell array containing the contents of all of
            %     the data filed selected
            
            % select data file(s)
            [ datafile_name , datafile_path ] = uigetfile( '*.mat' , 'Choose data file(s) for merging...' , 'multiselect' , 'on' );
            
            % load in the data files
            if iscell( datafile_name )  % check if it's cell array
                data_merged = cell( 1 , length(datafile_name) );
                for i = 1 : length(datafile_name)
%                     data_merged{i} = load( [datafile_path , datafile_name{i}] );
                    temp = load( [datafile_path , datafile_name{i}] );
                    data_merged{i} = temp.sysidData;
                end
            else    % if not a cell array, turn it into 1x1 cell array
                data_merged = cell(1,1);
%                 data_merged{1} = load( [datafile_path , datafile_name] );
                temp = load( [datafile_path , datafile_name] );
                data_merged{1} = temp.sysidData;
                disp('FYI, you only selected one file so your output cell array will have dimension 1.');
            end   
            
            % change names of fields from uppercase to lowercase
            for i = 1 : size( data_merged , 2 )
                if ismember( 'T' , fields( data_merged{i} ) )
                    data_merged{i}.t = data_merged{i}.T;
                    data_merged{i} = rmfield( data_merged{i} , 'T' );
                end
                if ismember( 'Y' , fields( data_merged{i} ) )
                    data_merged{i}.y = data_merged{i}.Y;
                    data_merged{i} = rmfield( data_merged{i} , 'Y' );
                end
                if ismember( 'U' , fields( data_merged{i} ) )
                    data_merged{i}.u = data_merged{i}.U;
                    data_merged{i} = rmfield( data_merged{i} , 'U' );
                end
                if ismember( 'W' , fields( data_merged{i} ) )
                    data_merged{i}.w = data_merged{i}.W;
                    data_merged{i} = rmfield( data_merged{i} , 'W' );
                end
                if ismember( 'x' , fields( data_merged{i} ) )
                    data_merged{i}.y = data_merged{i}.x;
%                     data_merged{i} = rmfield( data_merged{i} , 'y' );
                end
            end
        end
        
        % get_data4sysid (save a file that can be used for sysid)
        function data4sysid = get_data4sysid( train , val , saveon , name )
            %get_data4sysid: Create a data structure with 'train' and 'val'
            % fields, which are requred to perform sysid.
            %   train - cell array containing training data (should get it
            %      from data.merge). Use [] if you want to select files.
            %   val - cell array containing validation data (should get it
            %      from data.chop). Use [] if you want to select files.
            %   saveon - (optional) if true, will save the output as a .mat 
            %      file in the 'datafiles' folder. False by default.
            %   name - string. Will be preappended to filedname if saveon
            %       is true.
            %   data4sysid - struct with fields 'train' and 'val', which
            %       are themselves cell arrays containing data for individual
            %       trials
            
            if nargin < 3
                saveon = false; % don't save output by default
            elseif nargin < 4
                name = [];  % name should be empty
            else
                name = [ name , '_' ];
            end
            
            % go get training and validation files if none provided
            if isempty( train )
                train = data.merge; % get training data
            elseif ~iscell( train ) % if 'train' is not a cell array, make it a 1x1 cell array
                train_temp = train;
                train = cell(1,1);
                train{1} = train_temp;
            end
            if isempty( val )
                val = data.merge;   % get validation data
            elseif ~iscell( val ) % if 'val' is not a cell array, make it a 1x1 cell array
                val_temp = val;
                val = cell(1,1);
                val{1} = val_temp;
            end
            
            % set output
            data4sysid.train = train;
            data4sysid.val = val;
            
            % save output
            if saveon
                dateString = datestr(now , 'yyyy-mm-dd_HH-MM'); % current date/time
                fname = [ 'datafiles' , filesep , name , 'train-', num2str( length(train) ) , '_val-' , num2str( length(val) ) , '_' , dateString , '.mat' ];
                unique_fname = auto_rename( fname , '(0)' );
                save( unique_fname , '-struct' ,'data4sysid' );
            end
        end
        
        % raw2filt (remove outliers and rename raw data fields)
        function data_filt = raw2filt( data )
            %raw2filt: Remove outliers from rename raw data fields so that
            %it has fields t,y,u.
            
            % change names of fields from uppercase to lowercase
            if ismember( 'T' , fields( data ) )
                data.t = data.T;
                data = rmfield( data , 'T' );
            end
            if ismember( 'Y' , fields( data ) )
                data.y = data.Y;
                data = rmfield( data , 'Y' );
            end
            if ismember( 'U' , fields( data ) )
                data.u = data.U;
                data = rmfield( data , 'U' );
            end
            if ismember( 'W' , fields( data ) )
                data.w = data.W;
                data = rmfield( data , 'W' );
            end
            if ismember( 'x' , fields( data ) )
                data.y = data.x;
            end
            
            % filter out outliers in the measured data
            data_filt.y = filloutliers( data.y , 'linear' );
            data_filt.t = data.t;
            data_filt.u = data.u;
            if ismember( 'w' , fields( data ) )
                data_filt.w = data.w;
            end
        end
        
        % process_rawdata (take raw data from experiments and turn it into 
        % a data file that can be used for sysid)
        function data4sysid = process_rawdata( len_val , name )
            %process_rawdata: take raw data from experiments and turn it into 
            % a data file that can be used for sysid.
            %   len_val - length of validation trials to create (in sec)
            %   name - string describing the system
            
            % Select raw data files and merge into one cell array
            data_merged = data.merge_files;
            
            % Remove outliears from the raw data
            data_filt = cell( size(data_merged) );
            for i = 1 : length( data_merged )
                data_filt{i} = data.raw2filt( data_merged{i} );
            end
            
            % Partition each trial into training and validation parts
            train = cell( size( data_filt ) );
            val = cell( size( data_filt ) );
            for i = 1 : length( data_filt )
                [ train{i} , val{i} ] = data.partition( data_filt{i} , len_val );
            end
            
            % combine into a single struct and save file
            data4sysid = data.get_data4sysid( train , val , 1 , name );
        end
        
        % isolate_states (isolate a few measured states, throw out the rest)
        function data_out = isolate_states( data_in , selmtx )
            %isolate_states: isolate a few of the measured states
            %   data_in - struct with fields t , y , (x)
            %   selmtx - selection matrix for desired states
            
            data_out = data_in;
            data_out.y = data_in.y * selmtx';
        end
        
        % process_rawdata (take raw data from experiments and turn it into 
        % a data file that can be used for sysid)
        function data4sysid = process_rawdata_iso( len_val , name , selmtx )
            %process_rawdata_iso: take raw data from experiments and turn it into 
            % a data file that can be used for sysid, and only isolate certain states.
            %   len_val - length of validation trials to create (in sec)
            %   name - string describing the system
            
            % Select raw data files and merge into one cell array
            data_merged = data.merge_files;
            
            % Remove outliears from the raw data
            data_filt = cell( size(data_merged) );
            for i = 1 : length( data_merged )
                data_filt{i} = data.raw2filt( data_merged{i} );
            end
            
            % Partition each trial into training and validation parts
            train = cell( size( data_filt ) );
            val = cell( size( data_filt ) );
            data_iso = cell( size(data_filt) );
            for i = 1 : length( data_filt )
                data_iso{i} = data.isolate_states( data_filt{i} , selmtx ); 
                [ train{i} , val{i} ] = data.partition( data_iso{i} , len_val );
            end
            
            % combine into a single struct and save file
            data4sysid = data.get_data4sysid( train , val , 1 , name );
        end
            
        % trim_rawdata (trim beginning/end off of raw data)
        function data_trimmed = trim_rawdata( data_in , offstart , offend )
            %trim_rawdata: trim data points off of the beginning and end of
            % a rawdata struct.
            %   data_in - struct containing raw data. Must have 'T' field
            %   offstart - time to trim from beginning, in seconds.
            %   offend - time to trim from the end, in seconds.
            %   saveon - true/false. If true, save the trimmed data file
            
            % find indices of data you want to keep
            interval = find( offstart < data_in.T & data_in.T < ( data_in.T(end) - offend ) );
            
            % iterate over fieldnames and remove data
            fn = fieldnames(data_in);
            for k=1:numel(fn)
                if( ~isempty(data_in.(fn{k})) )
                    % isolate the wanted data
                    data_trimmed.(fn{k}) = data_in.(fn{k})(interval,:);
                end
            end
            
            % remove offset so time starts at 0
            data_trimmed.T = data_trimmed.T - data_trimmed.T(1);
        end
        
        % trim_rawdata_fromfile (executes trim_rawdata, but loads and saves the file as well)
        function data_trimmed = trim_rawdata_fromfile( offstart , offend , saveon )
            %trim_rawdata_fromfile: executes trim_rawdata, but loads and
            %saves the file as well. This assumes the raw data is saved as
            %a struct called 'sysidData'. Saves trimmed data in folder
            %/rawdata/trimmed
            % Can handle multiple files at once via multiselect.
            %   data_trimmed - trimmed data struct, or cell array of data
            %       structs if multiple files were selected.
            %   saveon - true/false, decides whether to save files or not.
            
            % select data file(s)
            [ datafile_name , datafile_path ] = uigetfile( '*.mat' , 'Choose data file(s) for merging...' , 'multiselect' , 'on' );
            
            % output file path
            filepath = [ 'rawdata' , filesep , 'trimmed' , filesep ];
            
            % trim data from each of the files
            if iscell( datafile_name )
                data_trimmed = cell( size(datafile_name) );
                for i = 1 : length( datafile_name )
                    %load datafile
                    temp = load( [datafile_path , datafile_name{i}] );
                    data_raw = temp.sysidData;
                    data_trimmed{i} = data.trim_rawdata( data_raw , offstart , offend );
                    
                    if saveon
                        % create new file name and save
                        sysidData = data_trimmed{i};
                        filename = [ filepath , datafile_name{i}(1:end-4) , '_trimmed.mat' ];
                        save( filename , 'sysidData' );
                    end
                end
            else
                %load datafile
                temp = load( [datafile_path , datafile_name] );
                data_raw = temp.sysidData;
                data_trimmed = data.trim_rawdata( data_raw , offstart , offend );
                
                if saveon
                    % create new file name and save
                    sysidData = data_trimmed;
                    filename = [ filepath , datafile_name(1:end-4) , '_trimmed.mat' ];
                    save( filename , 'sysidData' );
                end
            end 
        end
        
    end
end


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
