
% Nama : Tiara Belva Pratistha
% NIM  : L0325014
% Kelas: 3B

%menghitung nilai sin x secara eksak
x = 1;
eksak = sin(x);

%menghitung nilai sin x dengan deret taylor
N = input("masukkan nilai N: ");
p = 0;
for i = 0:N
    p = p + ((-1)^i * x^(2*i+1) / factorial(2*i+1));
end

%menghitung error2
error = abs(eksak - p);

fprintf('Eksak\t\t= %5.15f\n', eksak);
fprintf('Pendekatan\t= %5.15f\n', p);
fprintf('Error\t\t= %5.15f\n\n', error);
fprintf('\nTiara Belva Pratistha - L0325014\n');
