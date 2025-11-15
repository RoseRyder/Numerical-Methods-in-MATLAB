function [slope]=lin_reg(mat)

x=mat(:,1);
y=mat(:,2);
X   = [ones(length(x),1), x];
XtX = X' * X ;
XtY = X' * y ;
M= XtX\XtY;
slope=M(2);

end
