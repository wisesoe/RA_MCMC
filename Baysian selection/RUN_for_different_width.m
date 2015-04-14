%% simulated data
 x1 = unifrnd(0,10,100,1);
 x2 = unifrnd(0,10,100,1);
 e = normrnd(0,2.5,100,1);
 y = 3*x1+e;
 x=[x1 x2];
regress(y,x)


%%  run MCMC
m=500;
width_max=10;

[result_total,I1,I2]=MCMC(y,x,m,1);


for  t=2:width_max 

[result,I1,I2]=MCMC(y,x,m,t);

result_total=[result_total,result];

end


%% plot 

plot(result_total)
figure
%plot solely
subplot(2,1,1)
plot(result_total(:,1:2:end))
xlabel('beta1')
subplot(2,1,2)
plot(result_total(:,2:2:end))
xlabel('beta2')
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
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

