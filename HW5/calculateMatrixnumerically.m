function [A, invA, d] = calculateMatrixnumerically(n)
    for d = 1:100 % 假設 d 的範圍為 1 到 100
        A = sym('A', [n n]); 
        rho = 1 - (10 ^ (-d));
        double(rho);
        for i = 1:n
            for j = 1:n
                A(i,j) = rho^(abs(i-j));
            end
        end
        invA = inv(A);
        if any(isinf(invA(:))) % 檢查反矩陣是否包含 inf
                disp(['* 當 n = ', num2str(n), ', d = ', num2str(d),' 時']);
                disp('無法利用程式計算反矩陣(反方陣中元素會出現Inf)');
                disp(' ');
                break
            end
        end
end 