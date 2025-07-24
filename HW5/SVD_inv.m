function [A, invA, d] = SVD_inv(n)
    show_final_message = true; 
    for d = 1:100 % 假設 d 的範圍為 1 到 100
        A = sym('A', [n n]);
        rho = 1 - 10^(-d);
        double(rho);
        for i = 1:n
            for j = 1:n
                A(i,j) = rho^(abs(i-j));
            end
        end
        U = SVD(A);
        S = SVD(A);
        V = SVD(A);
        V = V.';
        if any(isnan(U(:))) || any(isnan(S(:))) || any(isnan(V(:)))
            disp(['* 當 n = ', num2str(n), ', d = ', num2str(d),' 時']);
            disp('無法進行 QR by means of Givens rotations 分解，矩陣可能不可逆或存在數值問題');
            show_final_message = false; 
            break;
        end
        invU = inv(U);
        invS = inv(S);
        invV = inv(V);
        invA = invV * invS * invU;
        % 檢查反矩陣是否包含 Inf
        if any(isinf(invA(:)))
                disp(['* 當 n = ', num2str(n), ', d = ', num2str(d),' 時']);
                disp('無法利用程式計算反矩陣(反方陣中元素會出現Inf)');
                show_final_message = false; 
                break;
        end
    end
    if show_final_message == true
        fprintf(['* 當 n = ', num2str(n),',且rho很小(1 - 10^(-100))時, 依然可以利用此方法求得反方陣\n'])
        disp(' ')
    end
end