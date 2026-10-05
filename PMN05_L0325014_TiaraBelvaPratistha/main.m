%untuk panggil function dan menjalankan file antar metode

clear, clc
% ----- Matrix -----
A = [2  1 -1;
     4  3  1;
    -2  1  2];

b = [3; 9; 4];

[x_gauss, Ab_eliminasi] = gauss(A, b);

fprintf('\n----- Metode Eliminasi Gauss -----\n');
fprintf('\nHasil Gauss (substitusi mundur):\n');
fprintf('%.2f\n', x_gauss);

fprintf('\n----- Metode Gauss Jordan -----\n');
fprintf('Matriks setelah eliminasi maju (dipakai ulang di Gauss-Jordan):\n');
disp(Ab_eliminasi);

% ----- Metode Gauss-Jordan (lanjut dari hasil Gauss) -----
x_jordan = gaussJordan(Ab_eliminasi);

fprintf('\nHasil Gauss-Jordan:\n');
fprintf('%.2f\n', x_jordan);

fprintf('\n----- Metode Dekomposisi LU -----\n');
x_dekomLU = dekomLU(A, b);
fprintf('\nHasil Dekomposisi LU:\n');
fprintf('%.2f\n', x_dekomLU);

