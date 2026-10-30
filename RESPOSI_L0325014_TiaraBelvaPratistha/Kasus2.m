clc; clear;

%% 1. Konversi satuan ke kg
% Urutan kolom: Beras, Telur, Tepung, Ayam
A = [ 2500/1000   1500/1000   5          500/1000;    % Adel  (kg, g, kg, g)
      40*0.1      0.75        1000/1000  2;           % Briza (hg, kg, g, kg)
      2000/1000   15*0.1      50*0.01    6000/1000;   % Caca  (g, hg, dag, g)
      1           4250/1000   20*0.1     9*0.1 ];     % Dinda (kg, g, hg, hg)

b = [161000; 149000; 251500; 173000];

disp('Matriks koefisien A (dalam kg):');
disp(A);
disp('Vektor konstanta b (Rp):');
disp(b);

%% 2. Cek dominan diagonal (syarat konvergensi Gauss-Seidel)
n = size(A,1);
dominan = true;
for i = 1:n
    diag_i = abs(A(i,i));
    sisa   = sum(abs(A(i,:))) - diag_i;
    fprintf('Baris %d: |a_ii| = %.3f, jumlah lainnya = %.3f\n', i, diag_i, sisa);
    if diag_i <= sisa
        dominan = false;
    end
end

if dominan
    fprintf('\nMatriks DOMINAN DIAGONAL -> gunakan metode Gauss-Seidel\n');
    metode = 'Gauss-Seidel';
else
    fprintf('\nMatriks TIDAK dominan diagonal -> gunakan metode analitik (Gauss-Jordan)\n');
    metode = 'Gauss-Jordan';
end

%% 3. Penyelesaian
if strcmp(metode, 'Gauss-Seidel')
    x = zeros(n,1);
    tol = 1e-6; maxIter = 1000;
    for k = 1:maxIter
        x_lama = x;
        for i = 1:n
            s = A(i,:)*x - A(i,i)*x(i);
            x(i) = (b(i) - s) / A(i,i);
        end
        if norm(x - x_lama, inf) < tol
            break;
        end
    end
    fprintf('Konvergen pada iterasi ke-%d\n', k);
else
    % Eliminasi Gauss-Jordan dengan pivoting parsial
    Aug = [A b];
    for i = 1:n
        % Pivoting parsial
        [~, p] = max(abs(Aug(i:n, i)));
        p = p + i - 1;
        if p ~= i
            Aug([i p], :) = Aug([p i], :);
        end
        % Normalisasi baris pivot
        Aug(i,:) = Aug(i,:) / Aug(i,i);
        % Eliminasi pada semua baris lain
        for j = 1:n
            if j ~= i
                Aug(j,:) = Aug(j,:) - Aug(j,i)*Aug(i,:);
            end
        end
    end
    x = Aug(:, end);
end

%% 4. Hasil
nama = {'Beras','Telur','Tepung','Ayam'};
fprintf('\n=== HARGA PER KG ===\n');
for i = 1:n
    fprintf('%-7s : Rp %10.2f\n', nama{i}, x(i));
end

%% 5. Verifikasi
fprintf('\nVerifikasi dengan A\\b:\n');
disp((A\b)');
fprintf('Residu ||Ax - b|| = %.4e\n', norm(A*x - b));
