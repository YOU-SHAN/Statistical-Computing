function [Q,R]=QR_HR(A)
    [m,n]=size(A);
    R=A; 
    Q=eye(m); 
    for k=1:m-1
        x = zeros(m,1);
        x(k:m,1) = R(k:m,k);
        g= norm(x);
        v=x;
        v(k)=x(k)+g;
        s=norm(v);
        if s ~= 0  
            w = v/s;
            u = 2 * R.' * w;
            R = R-w * u'; 
            Q = Q-2 * Q * w * w.';
        end
    end
end