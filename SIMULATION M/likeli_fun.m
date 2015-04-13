function f = likeli_fun( a,I,y,x )

n=length(y);
sigma=1;

f=exp(-(y-I(1)*a(1)*x(:,1)-I(2)*a(2)*x(:,2))'*(y-I(1)*a(1)*x(:,1)-I(2)*a(2)*x(:,2))/(2*sigma^2));  

end
