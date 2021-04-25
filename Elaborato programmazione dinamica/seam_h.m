function [path] = seam_h(E)
%SEAM_H Determina il cammino orizzontale di peso minimo in una matrice
    [n,m] = size(E);
    % costruzione della matrice dinamica
    % per occupare meno memoria, viene sovrascritta la matrice E
    % per velocizzare l'esecuzione, il codice è vettorizzato
    for j = 2:m
        E(1,j) = E(1,j) + min(E(1,j-1), E(2,j-1));
        E(2:n-1,j) = E(2:n-1,j) + min(min(E(1:n-2,j-1), ...
                                          E(2:n-1,j-1)), ...
                                          E(3:n,  j-1));
        E(n,j) = E(n,j) + min(E(n-1,j-1), E(n,j-1));
    end
    % costruzione del cammino minimo
    path = zeros(m,1);
    [~,k] = min(E(:,m));
    path(m) = k;
    for j = m-1:-1:1
        candidati = [k, max(1,k-1), min(n,k+1)];
        [~,l] = min(E(candidati,j));
        k = candidati(l);
        path(j) = k;
    end
end
