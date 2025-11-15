clc;
clear;
%input
colors = lines(7);
x_eval=7;
figure;
hold on;
for w=1:7
x_data=linspace(-100, 100, w);
y_data=1./(1+x_data.^2);

%Newton's Divided Difference Table
n=length(x_data); % could be of y data too
div_diff=zeros(n,n);
div_diff(:,1)= y_data(:); % first column is y
for j=2:n
    for i=1:(n-j+1)
        div_diff(i,j)= (div_diff(i+1, j-1) - div_diff(i, j-1) )/...
            ( x_data(i+j-1)-x_data(i) ); % doubt
    end  
end

coeff=div_diff(1,:); %coeffs of newton's polynomial
%evaluate polynomial at x_eval
Pn=coeff(1);
product_term=1;
for k=2:n
    product_term=product_term* (x_eval-x_data(k-1));
    Pn=Pn+coeff(k)*product_term;
end


%Plotting the interpolation
xx=linspace( min(x_data)-1, max(x_data)+1, 200 );
yy=zeros(size(xx));

for i=1:length(xx)
    term=coeff(1);
    prod_term=1;
    for k=2:n
        prod_term=prod_term* (xx(i)-x_data(k-1));
        term=term+coeff(k)*prod_term;
    end
    yy(i)=term;
end

plot(x_data, y_data, 'ro', 'MarkerFaceColor', 'r'); hold on;
plot(xx, yy, 'Color', colors(w,:), 'LineWidth', 2, 'DisplayName',sprintf('Degree %d', w-1));
plot(x_eval, Pn, 'ks', 'MarkerSize', 8,'MarkerFaceColor', colors(w,:) );
xlabel('x'); ylabel('y');title('Newton''s Divided Difference Interpolation' );

grid on;
end
legend('show');  % show only polynomials in legend
hold off
