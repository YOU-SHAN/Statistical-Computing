function [L, U] = LU_f(A)
        [n n] = size(A);
        U = A;
        for j = 1:n-1
            for i = j+1:n
                U(i,:) = U(i,:) - (U(i,j)/U(j,j)) * U(j,:);
            end
        end
        L = eye(n);
        for i = 2:n
            L(i,1) = double(A(i,1)) / double(U(1,1));
        end
        for i = 3:n
            for j = 2:i-1
                L(i,j) = double(A(i,j));
                for k = 1:j-1
                    L(i,j) = L(i,j) - L(i,k) * U(k,j);
                end
                L(i,j) = L(i,j) / double(U(j,j));
            end    
        end    
end