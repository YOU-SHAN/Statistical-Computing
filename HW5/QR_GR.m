function [Q, R] = QR_GR(A)
    [n, m] = size(A);
    Q = eye(n);
    R = A;
    [rows, cols] = find(tril(ones(n, m), -1));
    for k = 1:length(rows)
        row = rows(k);
        col = cols(k);
        if R(row, col) ~= 0
            r = sqrt(R(col, col)^2 + R(row, col)^2);
            c = R(col, col) / r;
            s = -R(row, col) / r;
            R([col, row], :) = [R(col, :)*c + R(row, :)*(-s); R(col, :)*s + R(row, :)*c];
            Q(:, [col, row]) = [Q(:, col)*c + Q(:, row)*(-s), Q(:, col)*s + Q(:, row)*c];
        end
    end
    Q = Q(:, 1:m);
    R = R(1:m, :);
end
