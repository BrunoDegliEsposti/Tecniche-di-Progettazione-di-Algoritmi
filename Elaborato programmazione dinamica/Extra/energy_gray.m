function [E] = energy_gray(img)
%ENERGY_GRAY Calcola la norma 1 del gradiente di un'immagine in bianco e nero
    [dx,dy] = imgradientxy(img, 'sobel');
    E = abs(dx)+abs(dy);
end
