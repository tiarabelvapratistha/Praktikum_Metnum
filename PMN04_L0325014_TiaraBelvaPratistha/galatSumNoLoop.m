
% Nama : Tiara Belva Pratistha
% NIM  : L0325014
% Kelas: 3B

% a. menghitung penjumlahan secara eksak
eksak = 0.0;
for i = 1:20
    eksak = eksak + 1.0 / i;
end

% b. menghitung penjumlahan tapi dibulatkan dahulu
pembulatan = 0.0;
for j = 1:20
    pecahan = round(1.0 / j * 100) / 100;
    pembulatan = pembulatan + pecahan;
end


% c. menghitung penjumlahan menggunakan fungsi sum
n = 1:20;
deret = 1 ./ n;
sum_no_loop = sum(deret);

%menghitung galat antar metode b dan c terhadap metode eksak
galat_pembulatan = abs(eksak - pembulatan);
galat_sum = abs(eksak - sum_no_loop);

fprintf('_____________________________________________________________________________________\n');
fprintf('Metode Perhitungan          | Hasil Perhitungan         | Galat Error\n');
fprintf('_____________________________________________________________________________________\n');
fprintf('Eksak                       | %5.15f         | %5.15f\n', eksak, 0);
fprintf('Masing-masing dibulatkan    | %5.15f         | %5.15f\n', pembulatan, galat_pembulatan);
fprintf('Tanpa looping (sum)         | %5.15f         | %5.15f\n', sum_no_loop, galat_sum);
fprintf('_____________________________________________________________________________________\n');
fprintf('\nTiara Belva Pratistha - L0325014\n');

