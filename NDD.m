function out= NDD(x, y, x_eval)
n=length(x);
ddiff(:,1)=y(:);
for j=2:n
    for i=1:n-j+1
        ddiff(i, j)=(ddiff(i+1, j-1)-ddiff(i, j-1))/(x(i+j-1)-x(i));
    end
end
coeff=ddiff(1,:);
prod_term=1;

    Pn=coeff(1);
    for k=2:n
    prod_term=prod_term*(x_eval-x(k-1));
    Pn=Pn+coeff(k)*prod_term;

    end
out=Pn;
end