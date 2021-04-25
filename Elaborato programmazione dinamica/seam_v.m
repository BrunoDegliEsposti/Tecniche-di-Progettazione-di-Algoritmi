function [path] = seam_v(E)
%SEAM_V Determina il cammino verticale di peso minimo in una matrice
    [n,m] = size(E);
    % costruzione della matrice dinamica
    D = zeros(n,m);
    D(1,:) = E(1,:);
    for i = 2:n
        D(i,1) = E(i,1) + min(D(i-1,1), D(i-1,2));
        for j = 2:(m-1)
            D(i,j) = E(i,j) + min(D(i-1,j-1), min(D(i-1,j), D(i-1,j+1)));
        end
        D(i,m) = E(i,m) + min(D(i-1,m-1), D(i-1,m));
    end
    % costruzione del cammino minimo
    path = zeros(n,1);
    [~,k] = min(D(n,:));
    path(n) = k;
    for i = n-1:-1:1
        candidati = [k, max(1,k-1), min(m,k+1)];
        [~,l] = min(D(i,candidati));
        k = candidati(l);
        path(i) = k;
    end
end
