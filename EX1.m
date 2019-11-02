function [frequencias] = EX1(info, isTxt, alfabeto)
    %se nao fornecermos um alfabeto, criamos um
    if (nargin < 3)
        alfabeto = unique(info);
    end
    
    alfabeto2 = alfabeto;
    aux = alfabeto(numel(alfabeto));
    alfabeto(numel(alfabeto)+1) = aux + 1;
    
    %calculo da matriz de ocorrências
    frequencias = histcounts(info(:), alfabeto);
    bar(alfabeto2, frequencias);
    
    % se info for texto, as labels de Ox passam a ser as letras do alfabeto
    % latim
    if (isTxt)
        letras = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N',...
            'O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d',...
            'e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t',...
            'u','v','w','x','y','z'};
        set(gca,'xtick',[65:90, 97:122],'xticklabel',letras);
    end
end