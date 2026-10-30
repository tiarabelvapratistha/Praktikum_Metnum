clear; clc;

%% Parameter
lambda = 12;  v = 36;  x = 10;  h0 = 5;
N  = [23 24 25];                 % jumlah iterasi (suku deret)
t  = linspace(0, 5, 500);        % 0 <= t <= 5
z  = t*v/lambda;                 % argumen cos

%% Solusi eksak
h_eksak = h0*(cos(z) + exp(x));

%% Solusi pendekatan (deret Maclaurin)
h_aprox = zeros(numel(N), numel(t));
for i = 1:numel(N)
    n = N(i);
    k = 0:n-1;

    % cos(z) ÷ sum (-1)^k z^(2k)/(2k)!
    cos_aprox = zeros(size(z));
    for j = k
        cos_aprox = cos_aprox + (-1)^j * z.^(2*j) / factorial(2*j);
    end

    % e^x ÷ sum x^k/k!
    exp_aprox = sum(x.^k ./ factorial(k));

    h_aprox(i,:) = h0*(cos_aprox + exp_aprox);
end

%% Plot perbandingan
figure;
plot(t, h_eksak, 'k-',  'LineWidth', 2.5); hold on;
plot(t, h_aprox(1,:), 'r--', 'LineWidth', 1.8);
plot(t, h_aprox(2,:), 'g-.', 'LineWidth', 1.8);
plot(t, h_aprox(3,:), 'b:',  'LineWidth', 2.2);
grid on;
xlabel('t'); ylabel('h(t)');
title('Perbandingan Metode Eksak dan Pendekatan Deret Taylor');
legend('f_{eksak}', 'f_{n=23}', 'f_{n=24}', 'f_{n=25}', 'Location', 'best');

%% Galat rata-rata
toleransi = 1;   % %
fprintf('Galat rata-rata dari tiap metode pendekatan\n');
fprintf('------------------------------------------------------------\n');
for i = 1:numel(N)
    galat_mutlak   = abs(h_eksak - h_aprox(i,:));
    rerata_mutlak  = mean(galat_mutlak);
    galat_relatif  = mean(galat_mutlak ./ abs(h_eksak)) * 100;   % %

    fprintf('n = %d : rerata galat mutlak = %.6f | rerata galat relatif = %.6f %%\n', ...
            N(i), rerata_mutlak, galat_relatif);

    if galat_relatif < toleransi
        fprintf('         -> LAYAK digunakan (< %d%%)\n', toleransi);
    else
        fprintf('         -> TIDAK layak digunakan (>= %d%%)\n', toleransi);
    end
end
