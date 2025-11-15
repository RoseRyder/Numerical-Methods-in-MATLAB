function out=NonLinear(x, y, A, B, C)

alpha=[A;B;C];
  Sr_old = 1e6;
while true
    Sr=Sr_old;
    A=alpha(1);
    B=alpha(2);
    C=alpha(3);
        dda=@(A, B, C, T) 1;
        ddb=@(A,B,C,T) -1/(C+T);
        ddc=@(A,B,C,T) B/(C+T)^2;
        
        Yfit=A-B./(C+x);
        Yres=Yfit-y;
        n=length(x);
        DDA=zeros(n,1);
        DDB=zeros(n,1);
        DDC=zeros(n,1);
        for i=1:n
            DDA(i)=dda(A, B, C, x(i));
            DDC(i)=ddc(A, B, C, x(i));
            DDB(i)=ddb(A, B, C, x(i));
        
        end
        J=[DDA DDB DDC];
        P=J'*J;
        Q=J'*Yres;
        deltaA=-P\Q;
        alpha=alpha+deltaA;
        Sr_new=sum(Yres.^2);
        
        if abs(Sr_old - Sr_new) < 1e-6
            break;
        end
        Sr_old = Sr_new;

    end
out=alpha;

end