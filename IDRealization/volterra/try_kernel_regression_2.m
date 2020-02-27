% try_kernel_regression

%% simulate system

kfinal = 10;
numtrials = 1;

utrain = zeros( numtrials , kfinal );
for j = 1 : numtrials
    % generate input as a random walk in [-1,1]
    steps = randi([-1 1],1,kfinal);
    scales = rand(1,kfinal);
    u = zeros( 1 , kfinal);
    for i = 2 : length(steps)
        if u(i-1) >= 1
            u(i) = u(i-1) - 1e-1;
        elseif u(i-1) <= -1
            u(i) = u(i-1) + 1e-1;
        else
            u(i) = u(i-1) + 2e-1 * scales(i) * steps(i);
        end
    end
    utrain(j,:) = u;
end

% simulate system using these inputs
y0 = 0;
x0 = [0 0]';
ytrain = zeros( numtrials , kfinal );
for i = 1 : numtrials
    [ yout , xout ] = sim_discrete( @vf_siso , kfinal , x0 , y0 , utrain(i,:) );
    ytrain(i,:) = yout';
%     xtrain(i,:) = xout';
end
ktrain = 1 : kfinal;

%% identify volterra series

hor = kfinal; % length of model horizon (can't be more than kfinal)
p = 4; % order of discrete volterra series

% make input vectors that include 1 to hor points
Utrain = zeros( size(utrain,1) * hor , hor );
for i = 1 : size( utrain , 1 )
    for j = 1 : hor
        rowindex = hor * (i-1) + j;
        Utrain( rowindex , 1:j ) = utrain(i,1:j);
    end
end

% build data matrix for regression
data_output = reshape( ytrain(:,1:hor)' , [ hor*numtrials , 1 ] );    % stack trials
data_input = zeros(hor*numtrials,hor);
for k = 1 : numtrials
    for i = 1 : hor
        for j = 1 : hor
                rowindex = hor*(k-1)+j;
                data_input(rowindex,i) = ( 1 + Utrain( hor*(k-1)+i ,:) * Utrain(rowindex,:)' )^p;
        end
    end
end

% solve for the coefficients
Alpha = lsqminnorm( data_input , data_output );

%% validate the identified model

numtrials = 1;  % reset to just one validation trial

% generate new set of validation inputs as a random walk in [-1,1]
uval = zeros( numtrials , kfinal );
for j = 1 : numtrials
    % generate input as a random walk in [-1,1]
    steps = randi([-1 1],1,kfinal);
    scales = rand(1,kfinal);
    u = zeros( 1 , kfinal);
    for i = 2 : length(steps)
        if u(i-1) >= 1
            u(i) = u(i-1) - 1e-1;
        elseif u(i-1) <= -1
            u(i) = u(i-1) + 1e-1;
        else
            u(i) = u(i-1) + 2e-1 * scales(i) * steps(i);
        end
    end
    uval(j,:) = u;
end
% uval = utrain(1,:);     % FOR DEBUGGING to see how well it works for data in the training set.

% simulate system using these inputs and real model
y0 = 0;
x0 = [0 0]';
yval = zeros( numtrials , kfinal );
for i = 1 : numtrials
    [ yout , xout ] = sim_discrete( @vf_siso , kfinal , x0 , y0 , uval(i,:) );
    yval(i,:) = yout';
%     xtrain(i,:) = xout';
end
kval = 1 : kfinal;


% make input vectors that include 1 to hor points
Uval = zeros( size(utrain,1) * hor , hor );
for i = 1 : size( uval , 1 )
    for j = 1 : hor
        rowindex = hor * (i-1) + j;
        Uval( rowindex , 1:j ) = uval(i,1:j);
    end
end


% build data matrix for regression
val_output_real = reshape( yval(:,1:hor)' , [ hor*numtrials , 1 ] );    % stack trials
val_input = zeros( hor*numtrials , hor );
for k = 1 : numtrials
    for i = 1 : hor
        for j = 1 : hor
                rowindex = hor*(k-1)+j;
                val_input(rowindex,i) = ( 1 + Utrain( hor*(k-1)+i ,:) * Uval(rowindex,:)' )^p;
        end
    end
end

% compute response based on the model
val_output_fake = val_input * Alpha;

% plot the real model verse the fake one
figure;
hold on;
plot(val_output_real);
plot(val_output_fake);
hold off;
legend('Real','Volterra');


%% Just do regular regression (only works for one trial right now)

% matrix of exponents. Each row gives exponents for 1 monomial
exponents = zeros(1,hor);
for i = 1:p
   exponents = [exponents; partitions(i, ones(1,hor))]; 
end
M = size( exponents , 1 );  % number of coefficients needed to be solved

% build data matrix for regression
reg_output = data_output;
reg_input = zeros( size( Utrain , 1 ) , M );
for i = 1 : size( Utrain , 1 )
    for j = 1 : M
        monomial = prod( Utrain(i,:).^exponents(j,:) );
        reg_input(i,j) = monomial;
    end
end

% solve for the coefficients
Gamma = lsqminnorm( reg_input , reg_output );


%% validate the regular regression

% simulate using the identified model
yout_reg = zeros( kfinal , 1 );
uout_reg = uval;
for i = 1 : kfinal
    monomial_vec = prod( kron( ones(M,1) , Uval(i,:) ) .^ exponents, 2 );
    yout_reg(i) = Gamma' * monomial_vec;
end

% plot the real model verse the fake one
figure;
hold on;
plot(yval);
plot(yout_reg);
hold off;
legend('Real','Volterra');













