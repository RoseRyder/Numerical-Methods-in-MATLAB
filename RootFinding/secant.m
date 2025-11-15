%Secant Method
function [roots, total_i]= bisection( bisectionv, tolerance, max_iter, range)
clc
clear all
tolerance=1E-6;
max_iter=1000;
A=8.11220;
B=1592.864;
C=226.184;
P_sat=400;
bisectionv = @(T) (log10(P_sat)-(A-B./(C+T)))
a_next=100;
b_next=1000;
for j=1:max_iter
    a=a_next;
    b=b_next;
    fA=bisectionv(a);
    fB=bisectionv(b);
    c=b-(  fB*(b-a)/(fB-fA) );
    fC=bisectionv(c);
    if fC == 0
        fprintf("Exact root found: %d, iterations : %d\n", c , j);
        break;
    else
        if abs(fC)>tolerance
            b_next=c;
            a_next=b;
        else
            fprintf("Tolerance reached, root is : %d, iterations : %d\n", c, j);
            break;
        end
    end
end
