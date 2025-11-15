function out=Linear(x, y)

col=ones(length(x), 1);
Z=[col x];
A=Z'*Z;
b = Z'*y;
out=A\b;


end