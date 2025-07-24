function plotErrorVariationWithD(n)
    % 設定 d 的範圍
    d_values = 1:10;
    
    % 初始化誤差矩陣
    errors = zeros(length(d_values), 7);
    
    for k = 1:length(d_values)
        d = d_values(k);
        errors(k, :) = computeErrors(d, n);
    end
    
    % 繪製誤差變化圖
    methods = {'Built-in inv', 'LU', 'Cholesky', 'QR Gram-Schmidt', 'QR Householder', 'QR Givens', 'SVD'};
    figure;
    hold on;
    for methodIdx = 1:7
        plot(d_values, errors(:, methodIdx), '-o', 'DisplayName', methods{methodIdx});
    end
    hold off;
    xlabel('d 值');
    ylabel('誤差');
    title('不同矩陣分解方法的誤差隨 d 值的變化');
    legend('show');
    grid on;
end

function errors = computeErrors(d, n)
    % 初始化誤差向量
    errors = zeros(1, 7);
    
    % 構建矩陣 A
    rho = 1 - (10 ^ (-d));
    A = zeros(n, n);
    for i = 1:n
        for j = 1:n
            A(i, j) = rho^(abs(i - j));
        end
    end
    
    % 1. 內建函數
    invA_1 = inv(A);
    errors(1) = norm(eye(n) - A * invA_1);
    
    % 2. LU 分解
    [L, U] = LU_f(A);
    invA_2 = inv(U) * inv(L);
    errors(2) = norm(eye(n) - A * invA_2);
    
    % 3. Cholesky 分解（適用於正定矩陣）
    L = CF(A);
    L_t = L.';
    invL = inv(L);
    invL_t = inv(L_t);
    invA_3 = invL_t * invL;
    errors(3) = norm(eye(n) - A * invA_3);
   
    
    % 4. QR 分解（Gram-Schmidt）
    Q = GS(A);
    R = Q.' * A;
    invQ = inv(Q);
    invR = inv(R);
    invA_4 = invR * invQ;
    errors(4) = norm(eye(n) - A * invA_4);
    
    % 5. QR 分解（Householder reflections）
    Q = QR_HR(A);
    R = QR_HR(A);
    invQ = inv(Q);
    invR = inv(R);
    invA_5 = invR * invQ;
    errors(5) = norm(eye(n) - A * invA_5);
    
    % 6. QR 分解（Givens rotations）
    Q = QR_GR(A);
    R = QR_GR(A);
    invQ = inv(Q);
    invR = inv(R);
    invA_6 = invR * invQ;
    errors(6) = norm(eye(n) - A * invA_6);
    
    % 7. SVD 分解
    U = SVD(A);
    S = SVD(A);
    V = SVD(A);
    V = V.';
    invU = inv(U);
    invS = inv(S);
    invV = inv(V);
    invA_7 = invV * invS * invU;
    errors(7) = norm(eye(n) - A * invA_7);
end
