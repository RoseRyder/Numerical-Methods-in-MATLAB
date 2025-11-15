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
bisectionv = @(T) (log10(P_sat)-(A-B./(C+T)))
a_next=-200;
b_next=1000;

for j=1:max_iter
    a=a_next;
    b=b_next;
    fA=bisectionv(a);
    fB=bisectionv(b);
    c=(a+b)/2;
    fC=bisectionv(c);
    if fC == 0
        fprintf("Exact root found: %d, iterations : %d\n", c , j);
        break;
    else
        if abs(fC)>tolerance
            if fA*fC <0 
                b_next=c;
                a_next=a;
            end
            if fC*fB <0
                b_next=b;
                a_next=c;
            end
        else
            fprintf("Tolerance reached, root is : %d, iterations : %d\n", c, j);
            break;
        end
    end
end
