function [img] = carve_h(img, path)
%CARVE_H Elimina un cammino orizzontale da una matrice/immagine
    [n,m,~] = size(img);
    for j = 1:m
        k = path(j);
        if k ~= n
            img(k:end-1,j,:) = img(k+1:end,j,:);
        end
    end
    img = img(1:end-1,:,:);
end
