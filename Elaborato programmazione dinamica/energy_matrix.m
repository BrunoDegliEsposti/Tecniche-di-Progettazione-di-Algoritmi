function [E] = energy_matrix(img)
%ENERGY_MATRIX Calcola la norma 1 del gradiente di un'immagine
    img = im2single(img);
    [n,m,channels] = size(img);
    E = zeros(n,m);
    for k = 1:channels
        [dx,dy] = imgradientxy(img(:,:,k), 'sobel');
        E = E + abs(dx) + abs(dy);
    end
end
