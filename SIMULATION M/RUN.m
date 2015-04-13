
%[y,x,t]=textread('j.dat');

% y=[3;6;9;12;15;18;21;24;27;30];
% x=[1 5;2 5;3 5;3.99 5;5 5;6 5;7 5;8 5;9 4;10 5];


 x1 = unifrnd(0,10,100,1);
 x2 = unifrnd(0,10,100,1);
 e = normrnd(0,2.5,100,1);
 y = 3*x1+e;
 x=[x1 x2];
regress(y,x)


sample=[0,0,0,0,0,0,0,0,4];
run_number=10000;
randwidth=2;
Model_number=4;

[RESULT,M_prob]=MCMC( sample , y , x , run_number , randwidth  ,Model_number);

hist(RESULT(:,9))
% 
% %plot
% %                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
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


% subplot(3,1,3)
% hist(result(m/2:end,3),50);
% xlabel('tau')


% 
%  regress(y,[zeros(length(y),1) x])