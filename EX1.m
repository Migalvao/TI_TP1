function [frequencias] = EX1(info, txt, alfabeto)
    %se nao fornecermos um alfabeto, criamos um
    if (nargin < 3)
        alfabeto = unique(info);
    end
    %calculo da matriz de ocurr�ncias
    frequencias = histcounts(info(:), vertcat(alfabeto, alfabeto(numel(alfabeto))+1));

    if (txt~=1)
        bar(frequencias)
    else
        bar(frequencias)
        %se for um ficheiro texto, vamos legendar o eixo Ox com as letras
        %correspondentes
        letras = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
        set(gca,'xtick',[65:90, 97:122],'xticklabel',letras);
    end
end