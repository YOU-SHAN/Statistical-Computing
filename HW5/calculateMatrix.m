function [A, invA] = calculateMatrix(n)
        syms rho;
        A = sym('A', [n n]); 
        for i = 1:n
            for j = 1:n
                A(i,j) = rho^(abs(i-j));
            end
        end
        invA = inv(A);
        % 顯示矩陣 A 和其逆矩陣 invA
        disp('Matrix A:');
        disp(A);
        disp('Inverse of A:');
        disp(invA);

end

    
