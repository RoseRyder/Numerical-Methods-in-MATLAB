clc 
clear all
A=[2 6 7 8;
    4 9 5 2;
    3 8 6 12;
    5 7 9 14];
b=[10;11;13;15];
    Ab=[A b]; %augmented matrix
    R=rref(Ab); %row reduced echelon
    C=R(:,end);  %solution vector
    C