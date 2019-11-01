function [comprimido] = EX5(file)
    [fPath, fName, fExt] = fileparts(file);
    
    if (fExt == '.bmp')
        img = imread(file);
        %temos de bassar para 16 bits para podermos dar shift para a
        %esquerda
        img = uint16(img);
        
        %Criar um array só com os elementos nas posiçoes pares
        aux = img(2:2:end);
        
        %Criar um array só com os elementos nas posiçoes impares e
        %adicionar 8 zeros (em binario) a seguir ao numero
        aux2 = bitshift(img(1:2:end), 8);
        %se a imagem tiver um numero impar de elementos eliminamos o ultimo
        if(length(aux) ~= length(aux2))
            aux2(end) = [];
        end
        %somar os dois arrays
        comprimido = aux + aux2;
        
        %hitograma
        frequencias = EX1(comprimido, 0);
        
        [entropy] = EX2(comprimido, unique(comprimido), frequencias);
        fprintf("Média de bits por simbolo : %f\n", entropy/2);
        fprintf("Variancia: %f\n\n", var(hufflen(frequencias)));
        
    elseif (fExt == '.wav')
        [info, ~] = audioread(file);
        
        %Criar um array só com os elementos nas posiçoes pares
        aux = info(2:2:end);
        %Criar um array só com os elementos nas posiçoes impares e
        %adicionar 8 zeros (em binario) a seguir ao numero
        aux2 = info(1:2:end) * power(2, 8);
        
        %se a imagem tiver um numero impar de elementos eliminamos o ultimo
        if(length(aux) ~= length(aux2))
            aux2(end) = [];
        end
        %somar os dois arrays
        comprimido = aux + aux2;
        
        %aqui para o histograma damos a transposta porque o som e uma
        %matriz com uma so coluna
        frequencias = EX1(comprimido', 0);
     
        [entropy] = EX2(comprimido', unique(comprimido), frequencias);
        fprintf("Média de bits por simbolo : %f\n", entropy/2);
        fprintf("Variancia: %f\n\n", var(hufflen(frequencias)));
        
    elseif (fExt == '.txt')
        fileID = fopen(file);
        info = fscanf(fileID, "%s");
        %temos de usar double em txt para passar carateres para inteiros
        %Criar um array só com os elementos nas posiçoes pares
        aux = double(info(2:2:end));
        %Criar um array só com os elementos nas posiçoes impares e
        %adicionar 8 zeros (em binario) a seguir ao numero
        aux2 = double(info(1:2:end)) * power(2,8);
        
        if(length(aux) ~= length(aux2))
            aux2(end) = [];
        end
        
        %somar os dois arrays
        comprimido = aux + aux2;
        
        frequencias = EX1(comprimido, 0);
        [entropy]= EX2(comprimido, unique(comprimido), frequencias);
        fprintf("Média de bits por simbolo : %f\n", entropy/2);
        fprintf("Variancia: %f\n\n", var(hufflen(frequencias)));
    end
    
    title(fName);
end