clc
clear all
A = [ 0.35 0.16 0.21 0.01;
    0.54 0.42 0.54 0.10;
    0.04 0.24 0.10 0.65;
    0.07 0.18 0.15 0.24];
n=4;
xf=[0.2;0.4;0.25;0.15]; %what is this
Q=[1000,500,100,50,10,5]; %This is Q
b=Q(1).*xf;


for i=2:length(Q) % what is this
    b=[b, (Q(i) .* xf)];
end

[L, U] = lu_doolittle(A);  
y = forward_sub(L, b);    
x = back_sub(U, y);      

L
U

function [L,U] = lu_doolittle(A);
[n,~] = size(A);
    L = eye(n);
    U = zeros(n);

    for i=1:n
        for j=i:n
            U(i,j) = A(i,j) - L(i,1:i-1)*U(1:i-1,j);
        end
        for j=i+1:n
            L(j,i) = (A(j,i) - L(j,1:i-1)*U(1:i-1,i))/U(i,i);
        end
    end
end
function y = forward_sub(L,b)
[n,~]=size(L);
[~,q]=size(b);
y=zeros(n,q);
    for i=1:n
    y(i,:) = ( b(i,:) - L(i, 1:i-1)* y(1:i-1, :)) / L(i,i);
    end    

end


function x = back_sub(U,y)
[n,~]=size(U);
x = zeros(n, size(y, 2));

    for i=n:-1:1
      x(i, :) = ( y(i,:) - U(i, i+1:end) * x(i+1:end, :) ) / U(i, i);

    end
end



