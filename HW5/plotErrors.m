function plotErrors(d, n)
    % 初始化誤差陣列
    errors = zeros(7, 1);
    
    % 構建矩陣 A
    rho = 1 - (10 ^ (-d));
    A = zeros(n, n);
    for i = 1:n
        for j = 1:n
            A(i, j) = rho^(abs(i - j));
        end
    end
    
    % 計算不同方法的誤差
    % 1. 內建函數
    invA_1 = inv(A);
    errors(1) = norm(eye(n) - A * invA_1);
    
    % 2. LU 分解
    [L, U] = lu(A);
    invA_2 = inv(U) * inv(L);
    errors(2) = norm(eye(n) - A * invA_2);
    
    % 3. Cholesky 分解（適用於正定矩陣）
    if isPositiveDefinite(A)
        L = chol(A, 'lower');
        invL = inv(L);
        invA_3 = invL' * invL;
        errors(3) = norm(eye(n) - A * invA_3);
    else
        errors(3) = NaN; % 若矩陣不是正定矩陣，則無法計算
    end
    
    % 4. QR 分解（Gram-Schmidt）
    [Q, R] = qr(A);
    invA_4 = inv(R) * inv(Q);
    errors(4) = norm(eye(n) - A * invA_4);
    
    % 5. QR 分解（Householder reflections）
    [Q, R] = qr(A);
    invA_5 = inv(R) * inv(Q);
    errors(5) = norm(eye(n) - A * invA_5);
    
    % 6. QR 分解（Givens rotations）
    [Q, R] = qr(A);
    invA_6 = inv(R) * inv(Q);
    errors(6) = norm(eye(n) - A * invA_6);
    
    % 7. SVD 分解
    [U, S, V] = svd(A);
    invA_7 = V * inv(S) * U';
    errors(7) = norm(eye(n) - A * invA_7);
    
    % 繪製誤差圖
    methods = {'Built-in inv', 'LU', 'Cholesky', 'QR Gram-Schmidt', 'QR Householder', 'QR Givens', 'SVD'};
    figure;
    bar(errors);
    set(gca, 'XTickLabel', methods, 'XTick', 1:numel(methods));
    xlabel('方法');
    ylabel('誤差');
    title('不同矩陣分解方法的誤差');
    grid on;
end

function isPD = isPositiveDefinite(A)
    % 檢查矩陣是否為正定矩陣
    isPD = all(eig(A) > 0);
end
