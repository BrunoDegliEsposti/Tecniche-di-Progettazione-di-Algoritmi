image = rgb2gray(im2single(imread('kodim06.png')));
[dx,dy] = imgradientxy(image);
%imshowpair((dx+4)/8, (dy+4)/8, 'montage');
e1 = (abs(dx)+abs(dy))/8;
e2 = sqrt(dx.^2 + dy.^2)/sqrt(32);
%imshowpair(e1, e2, 'montage');