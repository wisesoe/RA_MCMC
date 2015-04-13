function f = con_prob_beta1( a,I,y,x )

n=length(y);

%f=a(3)^(-n/2)*exp(-(y-a(1)-a(2)*x)'*(y-a(1)-a(2)*x)/(2*a(3)))*exp(-a(1)^2/6);

f=-(y-I(1)*a(1)*x(:,1)-I(2)*a(2)*x(:,2))'*(y-I(1)*a(1)*x(:,1)-I(2)*a(2)*x(:,2))/2  -  a(1)^2/6;

end

