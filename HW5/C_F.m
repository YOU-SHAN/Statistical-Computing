function L = CF(A)
[~,n]=size(A);
L=zeros(n,n);
E=eig(A);
n=numel(A);
x=2;
for i=1:n
    if A(i)<=0
        x=0;
    end
end
if A ~= A.' || x==0
    disp('L cannot not be found out');
    return;
end
for i=1:n
    for j=1:i
        if i==j
            L(i,j)=sqrt(A(i,j)-sum(L(i,1:j-1).^2));
        else
            L(i,j)=(A(i,j)-sum(L(i,1:j-1).*L(j,1:j-1)))/L(j,j);
        end
    end
end
end
