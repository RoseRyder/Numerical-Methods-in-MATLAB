%Illinois method
function [roots, total_i]= bisection( bisectionv, tolerance, max_iter, range)
clc
clear all
%range=[100,1000]; only this range is present in this code

tolerance=1E-6;

max_iter=1000;

%[r,c]=size(range) % this can be used if multiple ranges are present

A=8.11220;
B=1592.864;
C=226.184;
P_sat=400;
f = @(x) (log10(P_sat)-(A-B./(C+x)));
x_new=100;

for j=1:max_iter
    x=x_new;
    h=1E-10;
    m=(f(x+h)-f(x))/h;
    Fx=f(x);
    x_new=x-(Fx/m);
    if Fx == 0
        fprintf("Exact root found: %d, iterations : %d\n", x , j);
        break;
    else
        if abs(Fx)<tolerance
            fprintf("Tolerance reached, root is : %d, iterations : %d\n", x_new, j);
            break;
        else 
            continue;
        end
    end
end

