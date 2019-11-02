function [comprimido] = compressao(info, isWav)
    % cria array com elementos das posições ímpares
    impares = info(1:2:end);
    % cria array com elementos das posições pares
    pares = info(2:2:end);
    
    % se o número total de elementos for ímpar, elimina-se o último
    if (mod(numel(info), 2) ~= 0)
        impares(numel(impares)) = [];
    end
    
    % verifica se a info é .wav
    if (isWav)
        impares = impares * power(2, 8);
    else
        impares = bitshift(impares, 8);
    end
    
    comprimido = pares + impares;

end