function mInfo(query, target, alfabeto, step)
    auxInc = 1;
    coluna = 1;
    
    comparar = [];
    
    % nRepeticoes -> numero total de queries
    nRepeticoes = (size(target, 2) - size(query, 2) + 1) * (size(target, 1) - size(query, 1) + 1);
    
    % changeLine -> numero de queries por linha
    changeLine = size(target, 2) - size(query, 2) + 1;
    
    for k=1 : step : nRepeticoes
        
        if (mod(k + auxInc - 1, changeLine) == 0)
            auxInc = auxInc + 1;
            coluna = 1;
        end
        
%         comparar = zeros(size(query));
        
        
            comparar(k, 1:end) = target(auxInc, coluna : 3 + coluna - 2);
        
%         B = target(auxInc, isso : 3 + isso - 1)
comparar
        coluna = coluna + 1;
        
        % função para calcular informação mútua argin = (query, 
    end

end