%% simulated data
 x1 = unifrnd(0,10,100,1);
 x2 = unifrnd(0,10,100,1);
 e = normrnd(0,2.5,100,1);
 y = 3*x1+e;
 x=[x1 x2];
regress(y,x)


%%  run MCMC
m=1000;

run_time=20

[result_total,I1,I2]=MCMC(y,x,m);


for  t=2:run_time 

[result,I1,I2]=MCMC(y,x,m);

result_total=[result_total,result];

end


%% plot 

plot(result_total)
figure on
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
% subplot(2,2,1)
% hist(result(m/2:end,1),20);
% xlabel('beta1')
% subplot(2,2,2)
% plot(result(:,1))
% subplot(2,2,3)
% hist(result(m/2:end,2),20);
% xlabel('beta2')
% subplot(2,2,4)
% plot(result(:,2))

