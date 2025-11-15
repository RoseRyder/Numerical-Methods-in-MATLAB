clc;
clear all;
data=[300	0.012;
320	0.045;
340	0.132;
360	0.350;
380	0.890];

x=data(:,1);
y=data(:,2);
    h=diff(x);
    n=length(x);
   
    M=zeros(n, n);
    M(1,1)=1;
    M(n,n)=1;
    for i=2:n-1
        M(i, i-1)=h(i-1);
        M(i, i)=2*(h(i)+h(i-1));
        M(i, i+1)=h(i);
    end
    b=zeros(n, 1);
    for i=2:n-1
    b(i)=3*( (y(i+1)-y(i))/h(i) - (y(i)-y(i-1))/h(i-1));
    end
   
    C=M\b;
    
    A=y(1:n-1);
    B=zeros(n-1,1);
    D=zeros(n-1,1);
    

    for i=1:n-1
    B(i)= (y(i+1)- y(i))/h(i) - (h(i)/3)*(2*C(i)+C(i+1));
    D(i)=(C(i+1)-C(i))/(3.* h(i));
    end


A
B
C
D
