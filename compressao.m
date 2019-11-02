function [comprimido] = compressao(info, isWav)
    % cria array com elementos das posi��es �mpares
    impares = info(1:2:end);
    % cria array com elementos das posi��es pares
    pares = info(2:2:end);
    
    % se o n�mero total de elementos for �mpar, elimina-se o �ltimo
    if (mod(numel(info), 2) ~= 0)
        impares(numel(impares)) = [];
    end
    
    % verifica se a info � .wav
    if (isWav)
        impares = impares * power(2, 8);
    else
        impares = bitshift(impares, 8);
    end
    
    comprimido = pares + impares;

end