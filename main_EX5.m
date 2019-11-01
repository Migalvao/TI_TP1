function main_EX5
    subplot(231)
    disp("Landscape");
    EX5("./data/landscape.bmp");    

    subplot(232)
    disp("MRI");
    EX5("./data/MRI.bmp");

    subplot(233)
    disp("MRI Binarized");
    EX5("./data/MRIBin.bmp");

    subplot(234)
    disp("SoundMono");
    EX5("./data/soundMono.wav");

    subplot(235)
    disp("Artic Monkeys lyrics");
    EX5("./data/lyrics.txt");

end