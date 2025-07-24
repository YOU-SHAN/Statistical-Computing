function [A, invA, d] = LU(n)
    for d = 1:100 % 假設 d 的範圍為 1 到 100
        A = sym('A', [n n]);
        rho = 1 - 10^(-d);
        double(rho);
        for i = 1:n
            for j = 1:n
                A(i,j) = rho^(abs(i-j));
            end
        end
        % 計算 LU 分解
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
        if any(isnan(U(:))) || any(isnan(L(:)))
            disp(['* 當 n = ', num2str(n), ', d = ', num2str(d),' 時']);
            disp('無法進行 LU 分解，矩陣可能不可逆或存在數值問題');
            break;
        end
        % 計算反矩陣
        invL = inv(L);
        invU = inv(U);
        invA = invU * invL;
             % 檢查反矩陣是否包含 Inf
        if any(isinf(invA(:)))
                disp(['* 當 n = ', num2str(n), ', d = ', num2str(d),' 時']);
                disp('無法利用程式計算反矩陣(反方陣中元素會出現Inf)');
                break;
        end
        end
end
