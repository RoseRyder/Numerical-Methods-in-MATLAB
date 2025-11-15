clc;
clear all;


for w=1:10
 x_data=linspace(-100, 100, w);
 y_data=1./(1+x_data.^2);

n=length(x_data);
xx=linspace(-100, 100, 1000);



for k=1:1000
    t=0;
    for i =1:n
        prod=1;
            for j=1:n
                if i~=j
                    prod=prod*(xx(k)-x_data(j))/ (x_data(j)-x_data(i));
                end
            end 
        t=t+prod*y_data(i);
        
    end


    yy(k)=t;
end


plot(xx, yy);
hold on
end
hold off

