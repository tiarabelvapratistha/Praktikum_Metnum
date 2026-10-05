%Metode Gauss

function [x, Ab_eliminasi] = gauss(A, b)
    n = length(b);
    Ab = [A b];   % matriks augmentasi [A | b]

    % ----- Tahap Eliminasi Maju -----
    for k = 1:n-1
        for i = k+1:n
            faktor = Ab(i,k) / Ab(k,k);
            Ab(i,k:n+1) = Ab(i,k:n+1) - faktor * Ab(k,k:n+1);
        end
    end

    Ab_eliminasi = Ab;   % simpan hasil sebelum substitusi mundur

    % ----- Tahap Substitusi Mundur -----
    x = zeros(n,1);
    x(n) = Ab(n,n+1) / Ab(n,n);
    for i = n-1:-1:1
        x(i) = (Ab(i,n+1) - Ab(i,i+1:n) * x(i+1:n)) / Ab(i,i);
    end
end
