function [E] = energy_rgb(img)
%ENERGY_RGB Calcola la norma 1 del gradiente di un'immagine rgb
    img = rgb2lin(img,'OutputType','single');
    img_r = img(:,:,1);
    img_g = img(:,:,2);
    img_b = img(:,:,3);
    [dx_r,dy_r] = imgradientxy(img_r, 'sobel');
    [dx_g,dy_g] = imgradientxy(img_g, 'sobel');
    [dx_b,dy_b] = imgradientxy(img_b, 'sobel');
    E = 0.2126*(abs(dx_r)+abs(dy_r)) ...
      + 0.7152*(abs(dx_g)+abs(dy_g)) ...
      + 0.0722*(abs(dx_b)+abs(dy_b));
end
