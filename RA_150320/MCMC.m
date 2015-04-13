function [sample_final I1 I2] = MCMC( y,x,m )
%y: observed data
%x: vector of all possible x
%m: chain length


%% initiate
% 加入一部分的分布信息
a0=[0,0];
m0 = 100; %initialization length
K = size(a0,2); assert(K==size(x,2)); %# of parameters
sample = randn(m0,K); %initialize with draws from N(0,1)
a = sample(end,:); %starting point


%% run MCMC
I1=zeros(1,2);  % record  
I2=zeros(1,2);  % record 

for t=m0:m
    b=zeros(1,2);
    aa=zeros(1,2);
    I=ones(1,2);

%% for beta1
    rnum = unifrnd(a(1)-1,a(1)+1);
    b(1)=rnum;b(2)=a(2);

% to decide whether beta2 is included    
    if abs(mean(sample(1:end,2)))<=std(sample(1:end,2))
        I(2)=0;
    end       
 
     I1=[I1;I];   % record
    
    if log(rand) < con_prob_beta1(b,I,y,x) - con_prob_beta1(a,I,y,x)
        a(1)=b(1);
    end

    
%% for beta2 
    I=ones(1,2);
    rnum = unifrnd(a(2)-1,a(2)+1);
    b(1)=a(1);b(2)=rnum;

% to decide whether beta1 is included   
    if abs(mean(sample(1:end,1)))<=std(sample(1:end,1))
        I(1)=0;
    end
    
    I2=[I2;I];
     
    if log(rand) < con_prob_beta2(b,I,y,x) - con_prob_beta2(a,I,y,x)
        a(2)=b(2);
    end
    

sample=[sample;a];  %记录

end

%%  final output
sample_final=sample(m0+1:end,:);

