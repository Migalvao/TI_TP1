function main_EX6
    subplot(3, 3, 1);
    imshow("./mi_data/query.bmp");
    title("Query");
    subplot(3,3,2);
    EX6("./mi_data/query.bmp", "./mi_data/target_original.bmp", (0:255), 15);
    subplot(3,3,3);
    EX6("./mi_data/query.bmp", "./mi_data/target_noise.bmp", (0:255), 15);
    subplot(3,3,4);
    EX6("./mi_data/query.bmp", "./mi_data/target_lightning_contrast.bmp", (0:255), 15);
    subplot(3,3,5);
    EX6("./mi_data/query.bmp", "./mi_data/target_inverted.bmp", (0:255), 15);
    subplot(3,3,6);
    EX6("./mi_data/query.bmp", "./mi_data/target1.bmp", (0:255), 15);
    subplot(3,3,7);
    EX6("./mi_data/query.bmp", "./mi_data/target2.bmp", (0:255), 15);
    subplot(3,3,8);
    EX6("./mi_data/query.bmp", "./mi_data/target3.bmp", (0:255), 15);
    subplot(3,3,9);
    EX6("./mi_data/query.bmp", "./mi_data/target4.bmp", (0:255), 15);
end