function [sample_final,M_PROB] = MCMC( sample , y , x , run_number , randwidth  ,Model_number)
%sample: initial value
%run_number:the time to run the MCMC
%randwidth: 
%Model_number: the number of model under selection

M_PROB=[0,0,0,0];    %For record the p(m|y)
I=[0,0,1,0,0,1,1,1];   % 4 model selection 

%%  MCMC  :mix 4 models to one similar code
for t=1:run_number
    
sample=[sample;zeros(1,9)];   %to record parameter of all 4 models and  M (The last one is M.)

  for j=1:Model_number      
      
     a= sample(end-1,2*j-1:2*j);   % the two parameters of jth model
             
     for i=1:2  
     b=a;     
     rnum = unifrnd(a(i)-randwidth,a(i)+randwidth);
     b(i)=rnum;
     
    if log(rand)  < log_likeli_fun( b ,I(2*j-1:2*j)  ,y, x )+ log_prior( b ,i )  - log_likeli_fun( a,I(2*j-1:2*j),y,x ) - log_prior( a ,i )
        a(i)=rnum;
    end
    
     end
     
    
     %  M_likelihood(j)=likeli_fun( a,I,y,x )*prior(a,1)*prior(a,2);
        M_likelihood(j) = log_likeli_fun( a,I(2*j-1:2*j),y,x );
     
     sample(end,2*j-1:2*j)= a;
   
  end

 %% ------------------------     simulate m   -----------------------------

M_prob=M_likelihood-logsumexp(M_likelihood,2);     % log ratio

M_PROB=[M_PROB ; exp(M_prob)];  %record 

U=log(rand);
if U<logsumexp(M_prob(1),2)
    m=1;
else if U<logsumexp(M_prob(1:2),2)
        m=2;
    else if U<logsumexp(M_prob(1:3),2)
            m=3;
        else m=4;
        end
    end
end

sample(end,end)=m;


end

sample_final=sample;    

