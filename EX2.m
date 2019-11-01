function [e] = EX2(info, frequencias)
    %calculo da matriz de probabilidade de cada elemento de info
    
    prob = frequencias / numel(info);
    e = entropia(prob);
end

function e = entropia(prob)
    if (size(prob, 2) < size(prob, 1))
        prob = prob';
    end
    
    e = -prob(prob~=0) * log2(prob(prob~=0)');
end
