function var = variancia(Hlen)
    %mean() devolve a media
    media = mean(Hlen);
    
    %devolve a media de um array composto do quadrado da diferen�a entre o
    %num de bits e a media
    var = mean(power(Hlen - media, 2));
    
end