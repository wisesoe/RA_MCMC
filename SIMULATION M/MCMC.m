function [sample_final,M_PROB] = MCMC( sample , y , x , run_number , randwidth  ,Model_number)


M_PROB=[0,0,0,0];    %For record the p(m|y)
I=[0,0,1,0,0,1,1,1];   % 4 model

for t=1:run_number
    
sample=[sample;zeros(1,9)];

  for j=1:Model_number
      
     a= sample(end-1,2*j-1:2*j);
             
     for i=1:2
     b=a;     
     rnum = unifrnd(a(i)-randwidth,a(i)+randwidth);
     b(i)=rnum;
     
    if rand<min(  1, ( likeli_fun( b ,I(2*j-1:2*j)  ,y, x )*prior( b ,i ) )/ ( likeli_fun( a,I(2*j-1:2*j),y,x ) * prior( a ,i )))
    % if log(rand)<min(  0,  log(likeli_fun( b ,I  ,y, x ))+log(prior( b ,i )) - log(likeli_fun( a,I,y,x )) - log(prior( a ,i )))
        a(i)=rnum;
    end
    
     end
     
    
     % M_likelihood(j)=likeli_fun( a,I,y,x )*prior(a,1)*prior(a,2);
     % M_likelihood(j)=likeli_fun( a,I,y,x );
     
     sample(end,2*j-1:2*j)= a;
   
  end

 %------------------------     simulate m   -----------------------------
  
  for jj=1:Model_number
      M_prob(jj)=likeli_fun(sample(end,2*jj-1:2*jj),I(2*jj-1:2*jj),y,x)/(likeli_fun(sample(end,1:2),I(1:2),y,x)+likeli_fun(sample(end,3:4),I(3:4),y,x)+likeli_fun(sample(end,5:6),I(5:6),y,x)+likeli_fun(sample(end,7:8),I(7:8),y,x));
  end

M_PROB=[M_PROB ; M_prob];   %record

if ~isnan(sum(M_prob))

U=rand;
pm=[M_prob(1),M_prob(1)+M_prob(2),M_prob(1)+M_prob(2)+M_prob(3)];

if U<pm(1)
    m=1;
else if U<pm(2)
        m=2;
    else if U<pm(3)
            m=3;
        else m=4;
        end
    end
end

sample(end,end)=m;

else 
sample(end,end)=0;

end

end

sample_final=sample;

