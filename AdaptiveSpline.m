%find slope, if greater than 1, set flag vector=1

%Make a new h vector

%Make a new x vector with h vector

%Max no of iterations for h split and set a limit for no of nodes or set a
%minimum h




clc;
clear all;
h=20*ones(10, 1); % Have set number of h=10
Xi=-100; 
minH=0.1;
maxIter=200;
maxNodes=5000;
tol=1E-3;


index=1;
while index<maxIter 
    X=[Xi; zeros(length(h),1)];
    for j=1:length(h)
        X(j+1)=X(j)+h(j);
    end
    Y= 1./(1+X.^2);
    slopes=abs(diff(Y)./h);
    
    flag=zeros(1, length(h));
             for i =1:length(h)
                 if slopes(i)>tol && h(i)>minH
                     flag(i)=1;
                 end
             end
             newh=[];
             for i=1:length(h)
               
                if flag(i)==1
                     newh=[newh, h(i)/2, h(i)/2];
                else
                     newh=[newh, h(i)];
                end
             end 
               h=newh;
         
            
            if sum(flag)==0
                fprintf("Nothing to split")
                break;
            end
            if (length(X)-2) > maxNodes
                 fprintf("Max nodes reached, out.");
                 break;
            end

            
    index=index+1;
end
SimpleSpline (h, X);
