%Dekomposisi LU

function x = dekomLU(A, b)
    n = length(b);
    L = eye(n);     % diagonal L = 1
    U = zeros(n);

    % ----- Dekomposisi A = L*U -----
    for k = 1:n
        % Baris ke-k dari U
        for j = k:n
            U(k,j) = A(k,j) - L(k,1:k-1) * U(1:k-1,j);
        end
        % Kolom ke-k dari L
        for i = k+1:n
            L(i,k) = (A(i,k) - L(i,1:k-1) * U(1:k-1,k)) / U(k,k);
        end
    end

    fprintf('\nMatriks L:\n'); disp(L);
    fprintf('Matriks U:\n'); disp(U);

    % ----- Langkah 1: Ly = b (substitusi maju) -----
    y = zeros(n,1);
    for i = 1:n
        y(i) = b(i) - L(i,1:i-1) * y(1:i-1);
    end

    % ----- Langkah 2: Ux = y (substitusi mundur) -----
    x = zeros(n,1);
    x(n) = y(n) / U(n,n);
    for i = n-1:-1:1
        x(i) = (y(i) - U(i,i+1:n) * x(i+1:n)) / U(i,i);
    end

    fprintf('\nVektor y (dari Ly = b):\n');
    fprintf('%.2f\n', y);

    fprintf('\nHasil solusi x (dari Ux = y):\n');
    fprintf('%.2f\n', x);

end

