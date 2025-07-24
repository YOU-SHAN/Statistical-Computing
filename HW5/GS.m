function [Q] = GS(A)
    [~,c]=size(A);
    Q=zeros(size(A));
    for i=1:c
        Q(:,i) = A(:,i);
        for j=1:i-1
            proj = dot(A(:,i), Q(:,j)) * Q(:,j)/dot(Q(:,j), Q(:,j));
            Q(:,i) = Q(:,i)-proj;
        end
        Q(:,i) = Q(:,i)/norm(Q(:,i));
    end
end





