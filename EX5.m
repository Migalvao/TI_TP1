function [comprimido] = EX5(file)
    [fPath, fName, fExt] = fileparts(file);
    
    if (fExt == '.bmp')
        img = imread(file);
        %temos de bassar para 16 bits para podermos dar shift para a
        %esquerda
        img = uint16(img);
        
        comprimido = compressao(img, 0);
        
        %hitograma
        
        frequencias = EX1(comprimido, 0);
        [entropia, ~]= EX2(comprimido, frequencias);
        fprintf("Média de bits por simbolo : %f\n", entropia/2);
        
        
    elseif (fExt == '.wav')
        [info, ~] = audioread(file);
        
        comprimido = compressao(info, 1);
        
        %aqui para o histograma damos a transposta porque o som e uma
        %matriz com uma so coluna
        frequencias = EX1(comprimido', 0);
     
        [entropia, ~]= EX2(comprimido, frequencias);
        fprintf("Média de bits por simbolo : %f\n", entropia/2);
        
        
    elseif (fExt == '.txt')
        fileID = fopen(file);
        info = fscanf(fileID, "%s");
        
        comprimido = compressao(double(info), 0);
        
        frequencias = EX1(comprimido, 0);
        [entropia, ~]= EX2(comprimido, frequencias);
        fprintf("Média de bits por simbolo : %f\n", entropia/2);
        
    end
    
    title(fName);
end