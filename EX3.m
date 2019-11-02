function [] = EX3(file)
    
    %obter o nonme do ficheiro e a sua extensao
    [~, fName, fExt] = fileparts(file);
    
    %se for imagem
    if (fExt == '.bmp')
        img = imread(file);
        %produz histograma
        frequencias = EX1(img, 0);
        %calculo da entropia e da matriz de ocorrências
        [entropia, prob] = EX2(img, frequencias);
        [entropiaCHuff, variancia] = EX4(frequencias, prob);
        fprintf("Média de bits por simbolo : %f\n", entropia);
        fprintf("Codificação de Huffman, Média de bits por simbolo : %f\n", entropiaCHuff);
        fprintf("Variancia: %f\n\n", variancia);
        
        
    %se for som
    elseif (fExt == '.wav')
        [sinal, ~] = audioread(file);
        info = audioinfo(file);
        
        %obter o alfabeto para o som, (-1, -1+d, -1+2d...1-d)
        d = 2 / 2^info.BitsPerSample;        
        alfabeto = -1:d:1-d;
        
        %histograma
        frequencias = EX1(sinal, 0, alfabeto');
        %entropia e matriz de ocorrências
        [entropia, prob] = EX2(sinal, frequencias);
        [entropiaCHuff, variancia] = EX4(frequencias, prob);
        fprintf("Média de bits por simbolo : %f\n", entropia);
        fprintf("Codificação de Huffman, Média de bits por simbolo : %f\n", entropiaCHuff);
        fprintf("Variancia: %f\n\n", variancia);
        
    %se for texto
    elseif (fExt == '.txt')
        fileID = fopen(file);
        txt = fscanf(fileID, "%s");
        %definir alfabeto, incluindo apenas as letras minusculas e
        %maisculas do alfabeto latino
        alfabeto = [double('A'):double('Z') double('a'):double('z')];
        
        %histograma
        frequencias = EX1(double(txt), 1, alfabeto');
        %entropia e matriz de ocorrências
        [entropia, prob] = EX2(double(txt), frequencias);
        [entropiaCHuff, variancia] = EX4(frequencias, prob);
        fprintf("Média de bits por simbolo : %f\n", entropia);
        fprintf("Codificação de Huffman, Média de bits por simbolo : %f\n", entropiaCHuff);
        fprintf("Variancia: %f\n\n", variancia);
    end
    
    title(fName);

end