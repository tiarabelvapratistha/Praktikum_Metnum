clear; clc;

%% 1. Fungsi
V  = 300;
f  = @(r) (2/3)*pi*r.^3 - V;

%% 2. Metode grafik untuk menentukan tebakan awal
r = linspace(0, 8, 400);
figure;
plot(r, f(r), 'b-', 'LineWidth', 2); hold on;
yline(0, 'k--');
grid on;
xlabel('r'); ylabel('f(r)');
title('Grafik f(r) = (2/3)\pir^3 - 300');

% Dari grafik, akar berada di sekitar r = 5 -> pilih selang [4, 6]
a = 4;  b = 6;
fprintf('f(%g) = %.4f\n', a, f(a));
fprintf('f(%g) = %.4f\n', b, f(b));
if f(a)*f(b) < 0
    fprintf('f(a)*f(b) < 0 -> akar ada di dalam selang [%g, %g]\n\n', a, b);
end
plot([a b], [f(a) f(b)], 'ro', 'MarkerFaceColor', 'r');

tol = 1e-6;  maxit = 100;

%% 3. Metode Biseksi
fprintf('=== METODE BISEKSI ===\n');
fprintf('%4s %10s %10s %10s %12s %12s\n','iter','a','b','c','f(c)','galat');
lo = a;  hi = b;  c_lama = lo;
for k = 1:maxit
    c = (lo + hi)/2;
    galat = abs(c - c_lama);
    fprintf('%4d %10.6f %10.6f %10.6f %12.3e %12.3e\n', k, lo, hi, c, f(c), galat);
    if f(lo)*f(c) < 0
        hi = c;
    else
        lo = c;
    end
    if abs(f(c)) < tol || (k > 1 && galat < tol)
        break;
    end
    c_lama = c;
end
r_bisek = c;  it_bisek = k;

%% 4. Metode Regula Falsi
fprintf('\n=== METODE REGULA FALSI ===\n');
fprintf('%4s %10s %10s %10s %12s %12s\n','iter','a','b','c','f(c)','galat');
lo = a;  hi = b;  c_lama = lo;
for k = 1:maxit
    c = hi - f(hi)*(hi - lo)/(f(hi) - f(lo));
    galat = abs(c - c_lama);
    fprintf('%4d %10.6f %10.6f %10.6f %12.3e %12.3e\n', k, lo, hi, c, f(c), galat);
    if f(lo)*f(c) < 0
        hi = c;
    else
        lo = c;
    end
    if abs(f(c)) < tol || (k > 1 && galat < tol)
        break;
    end
    c_lama = c;
end
r_rf = c;  it_rf = k;

%% 5. Hasil dan verifikasi
r_eksak = (450/pi)^(1/3);     % pembanding analitik
t_hasil = 2*r_bisek;

fprintf('\n=== HASIL ===\n');
fprintf('Biseksi      : r = %.6f cm (%d iterasi)\n', r_bisek, it_bisek);
fprintf('Regula Falsi : r = %.6f cm (%d iterasi)\n', r_rf, it_rf);
fprintf('Pembanding analitik (450/pi)^(1/3) = %.6f cm\n', r_eksak);
fprintf('Tinggi tabung t = 2r = %.6f cm\n', t_hasil);

V_tabung = pi*r_bisek^2*t_hasil;
V_bola   = (4/3)*pi*r_bisek^3;
fprintf('V tabung = %.4f cm^3\n', V_tabung);
fprintf('V bola   = %.4f cm^3\n', V_bola);
fprintf('V tabung di luar bola = %.4f cm^3 (target %d)\n', V_tabung - V_bola, V);

plot(r_bisek, 0, 'g*', 'MarkerSize', 12, 'LineWidth', 2);
legend('f(r)', 'f(r)=0', 'f(a), f(b)', 'Akar', 'Location', 'northwest');
