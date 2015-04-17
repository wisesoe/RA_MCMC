
%%  simulated data
 x1 = unifrnd(0,10,100,1);
 x2 = unifrnd(0,10,100,1);
 e = normrnd(0,2.5,100,1);
 y = 3*x1+e;
 x=[x1 x2];
regress(y,x)


%%   To run MCMC 
sample=[0,0,0,0,0,0,0,0,4];    % initial values 
run_number=200;
randwidth=1;
Model_number=4;

[RESULT,M_PROB]=MCMC( sample , y , x , run_number , randwidth  ,Model_number);


%%  PLOT

%plot the Markov chains
subplot(2,2,1)
plot(RESULT(2:end,1:2));
xlabel('model1')

subplot(2,2,2)
plot(RESULT(2:end,3:4));
xlabel('model2')

subplot(2,2,3)
plot(RESULT(2:end,5:6));
xlabel('model3')

subplot(2,2,4)
plot(RESULT(2:end,7:8));
xlabel('model4')

figure
hist(RESULT(:,9))
xlabel('Histogram of M')

