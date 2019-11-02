function [entropiaCHuff, variancia] = EX4(frequencias, prob)
    HLen = hufflen(frequencias);
    entropiaCHuff = sum(HLen.*prob);
    variancia = var(HLen, prob);
    
end
