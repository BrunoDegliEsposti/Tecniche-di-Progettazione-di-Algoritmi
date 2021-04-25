function [img] = carve_v(img, path)
%CARVE_V Elimina un cammino verticale da una matrice/immagine
    [n,m] = size(img);
    for i = 1:n
        k = path(i);
        if k ~= m
            img(i,k:end-1,:) = img(i,k+1:end,:);
        end
    end
    img = img(:,1:end-1,:);
end
