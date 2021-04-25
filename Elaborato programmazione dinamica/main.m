% Scelta dell'immagine
[file, path] = uigetfile('*.jpg;*.jpeg;*.png;*.bmp;*.gif');
if isequal(file,0)
    error('File non specificato');
end
img_original = imread(fullfile(path,file));
img = img_original;

% Input delle righe e colonne da rimuovere
parametri = inputdlg({'Numero di righe da rimuovere:','Numero di colonne da rimuovere:'});
remove_h = str2double(parametri{1});
remove_v = str2double(parametri{2});
if isnan(remove_h) || remove_h < 0 || remove_h > size(img,1)-5 ...
    || isnan(remove_v) || remove_v < 0 || remove_v > size(img,2)-5
    error('Input non valido');
end

% Euristica greedy per scegliere l'ordine in cui effettuare le rimozioni
stampe = true;
while remove_h > 0 && remove_v > 0
    E = energy_matrix(img);
    path1 = seam_h(E);
    path2 = seam_v(E);
    img1 = carve_h(img, path1);
    img2 = carve_v(img, path2);
    e1 = energy_mean(img1);
    e2 = energy_mean(img2);
    if e1 >= e2
        img = img1;
        remove_h = remove_h - 1;
        if stampe; fprintf("Rimozione orizzontale - nuova energia media %f\n", e1); end
    else
        img = img2;
        remove_v = remove_v - 1;
        if stampe; fprintf("Rimozione verticale - nuova energia media %f\n", e2); end
    end
end
while remove_h > 0
    E = energy_matrix(img);
    path = seam_h(E);
    img = carve_h(img, path);
    remove_h = remove_h - 1;
    if stampe; fprintf("Rimozione orizzontale - nuova energia media %f\n", energy_mean(img)); end
end
while remove_v > 0
    E = energy_matrix(img);
    path = seam_v(E);
    img = carve_v(img, path);
    remove_v = remove_v - 1;
    if stampe; fprintf("Rimozione verticale - nuova energia media %f\n", energy_mean(img)); end
end

% Confronto delle due immagini
figure(1); imshow(img_original);
figure(2); imshow(img);


