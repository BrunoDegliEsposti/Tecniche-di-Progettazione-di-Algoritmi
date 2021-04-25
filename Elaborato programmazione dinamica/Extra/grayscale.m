imGamma = im2single(imread('kodim06.png'));
figure(1); imshow(rgb2gray(imGamma));

imLinear = rgb2lin(imGamma);
imR = imLinear(:,:,1);
imG = imLinear(:,:,2);
imB = imLinear(:,:,3);

imR = 0.2126*imR + 0.7152*imG + 0.0722*imB;
imG = imR;
imB = imR;

imLinear = cat(3,imR,imG,imB);
imGamma = lin2rgb(imLinear);
figure(2); imshow(imGamma);