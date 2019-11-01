function main_EX3
    subplot(231)
    disp("Landscape");
    EX3("./data/landscape.bmp");    

    subplot(232)
    disp("MRI");
    EX3("./data/MRI.bmp");

    subplot(233)
    disp("MRI Binarized");
    EX3("./data/MRIBin.bmp");

    subplot(234)
    disp("SoundMono");
    EX3("./data/soundMono.wav");

    subplot(235)
    disp("Artic Monkeys lyrics");
    EX3("./data/lyrics.txt");
end