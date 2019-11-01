function [comprimido] = info_agrupada(info_1, info_2)
    
    %passa de 8 bits a 16 e da shift de 8 bits para a esquerda a uma
    aux = uint16(info_1);
    aux2 = bitshift(uint16(info_2), 8);
    
    %verifica se é impar
    if(length(aux) ~= length(aux2))
            aux2(end) = [];
    end
    
    comprimido = aux + aux2;
end