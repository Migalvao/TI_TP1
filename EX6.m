function [mutual_info] = EX6(query_file, target_file, alfabeto, step)
    [~, fName, ~] = fileparts(target_file);

    query = imread(query_file);
    target = imread(target_file);
    
    %O calculo da informacao mutua entre X e Y e dado pela entropia de X +
    %entropia de Y menos a entropia agrupada de X e Y. Neste caso o nosso X
    %vai ser a query e Y a janela, que vai estar sempre a mudar 
    
    %entropia de X
    entropia_query = EX2(query, alfabeto);
    
    %criar a matriz final inicialmente vazia
    mutual_info = [];
    
    for i=size(query,1): step : size(target, 1)      %percorrer linha a linha
        aux = [];
        for j=size(query,2): step : size(target, 2)       %percorrer ao longo da linha
            
            %definir a janela
            janela = target((i-size(query,1)+1: i),(j-size(query, 2)+1: j));
            
            %calculo da entropia de X e entropia agrupada de X e Y
            entropia_janela = EX2(janela, alfabeto);
            
            %aqui damos a informacao comprimida (devolvida pela funcao
            %inf_agrupada) e o alfabeto que é simplesmente o unique
            entropia_agrupada = EX2(info_agrupada(query, janela), unique(info_agrupada(query, janela))');
            
            %dar append ao novo valor de informacao mutua à nova linha 
            aux = [aux entropia_query + entropia_janela - entropia_agrupada];
        
        end
        %adicionar a linha completa ao array final de informacao mutua
        mutual_info = [mutual_info;aux];
    end
    
    %usando o max numa matriz desta forma, devolve uma matriz com uma so
    %coluna que contem o maior elemento de cada linha
    maiores_por_linha = max((mutual_info), [], 2);
    %aqui calculamos o maior de todos
    maior = max(maiores_por_linha);
    fprintf("%s\nInfo mútua máxima: %f\n", fName, maior);
    
    %obter coordenadas de onde a informacao mutua e maior
    [x, y] = find(mutual_info == maior);
    
    %imagem e retangulo vermelho
    imshow(target_file);
    title(fName);
    rectangle('Position', [((y-1)*step), ((x-1)*step), size(query,2), size(query,1)], 'LineWidth', 2,'LineStyle', '--', 'EdgeColor', 'r');

end