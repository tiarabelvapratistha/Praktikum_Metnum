
% Nama : Tiara Belva Pratistha
% NIM  : L0325014
% Kelas: 3B

%input nilai x
x = input("Masukkan nilai x: ");

%menghitung nilai e^x secara eksak
eksak = exp(x);

%menghitung nilai e^x dengan pendekatan deret taylor
n = input("Masukkan jumlah suku deret (n): ");
p = 0;

for i=0:n
    p = p + (x^i / factorial(i));
end

%menghitung galat/error
error = abs(eksak - p);

fprintf("\n=== Hasil Perhitungan ===\n");
fprintf('Nilai eksak\t\t= %5.15f\n', eksak);
fprintf('Pendekatan deret Taylor\t= %5.15f\n', p);
fprintf('Galat (error)\t\t= %5.15f\n', error);
fprintf('\nTiara Belva Pratistha - L0325014\n');

