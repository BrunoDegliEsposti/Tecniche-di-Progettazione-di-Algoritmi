function [e] = energy_mean(img)
%ENERGY_MEAN Calcola l'energia media dei pixel in un'immagine
    E = energy_matrix(img);
    e = mean(E,'all');
end

