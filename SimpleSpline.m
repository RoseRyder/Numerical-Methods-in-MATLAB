function []=SimpleSpline(H, X)

Y= 1./(1+X.^2);
Dy = -2 * X ./ (1 + X.^2).^2;
n=length(X);
M=zeros(n);
M(1,1)=1;
M(n,n)=1;

B=zeros(n,1);

for i=2:n-1
    M(i, i-1)=H(i-1);
    M(i,i)=2*( H(i-1)+H(i) );
    M(i, i+1)=H(i);

end
for i=2:n-1
    B(i)= 3*( ((Y(i+1)-Y(i))/H(i) )- ((Y(i)-Y(i-1))/H(i-1)));
end

C=M\B
a=Y(1:end-1)
b=zeros(n-1, 1)
for i=1:n-1
    b(i)= (Y(i+1)- Y(i))/H(i) - (H(i)/3)*(2*C(i)+C(i+1));
    d(i)=(C(i+1)-C(i))/(3.* H(i));
end
D=d'


for i=1:n-1
    x_inter=linspace(X(i), X(i+1), 100);
    y_inter=a(i) + b(i)*(x_inter-X(i))+  C(i)*(x_inter-X(i)).^2 + d(i) *(x_inter-X(i)).^3;
    plot(x_inter, y_inter)
    hold on
end



