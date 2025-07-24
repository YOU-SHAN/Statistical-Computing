function [U, S, V] = SVD(A)
    M1 = A * A.';
    [U, lambda] = eig(M1);
    [lambda_sorted, idx] = sort(diag(lambda), 'descend');
    U = U(:, idx);

    la = sqrt(lambda_sorted);

    M2 = A.' * A;
    [V, lambda] = eig(M2);
    [lambda_sorted, idx] = sort(diag(lambda), 'descend');
    V = V(:, idx);

    for i = 1:size(U, 2)
        U(:, i) = U(:, i) / norm(U(:, i));
    end
    for i = 1:size(V, 2)
        V(:, i) = V(:, i) / norm(V(:, i));
    end
    [r1 c1] = size(M1);
    [r2 c2] = size(M2);
    S = zeros(c1,r2);
    for i = 1 : length(la)
        S(i,i) = la(i); 
    end
end
