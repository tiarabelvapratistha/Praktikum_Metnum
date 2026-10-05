%Gauss Jordan

function x = gaussJordan(Ab_eliminasi)
    [n, ~] = size(Ab_eliminasi);
    Ab = Ab_eliminasi;

    % ----- Normalisasi tiap baris pivot jadi 1 -----
    for k = 1:n
        Ab(k,:) = Ab(k,:) / Ab(k,k);
    end

    % ----- Nolkan elemen DI ATAS diagonal -----
    % (bagian bawah sudah nol dari hasil eliminasi Gauss sebelumnya)
    for k = n:-1:2
        for i = 1:k-1
            faktor = Ab(i,k);
            Ab(i,:) = Ab(i,:) - faktor * Ab(k,:);
        end
    end
    fprintf('\nSetelah proses kolom %d:\n', k);
    disp(Ab);

    x = Ab(:, n+1);
end
