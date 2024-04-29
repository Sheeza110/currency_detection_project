clc
clearvars



note_img = rgb2gray(imread('1000f.jpg'));


imshow(note_img);



edge_img = edge(note_img, 'Canny'); % extract edges 
figure,imshow(edge_img);

roi = edge_img(:, 130:140); %region of interest where thread is present (include all rows and 130 to 140 cloumn number)


pixel_sum = sum(roi(:));                          
disp(['Total sum in ROI: ', num2str(pixel_sum)]);

figure,imshow(roi);
impixelinfo();


threshold = 150;


if pixel_sum > threshold
    disp('Real Pakistani 1000 note');
else
    disp('Fake Pakistani 1000 note');
end





%{
image = rgb2gray(imread('1000f.jpg'));


edgeImg = edge(image, 'Canny');


% thread is present in the 2 segment if we divide note in 4 segments 

imgWidth = size(edgeImg, 2);  
segmentWidth = imgWidth / 4;


startCol = round(segmentWidth * 1.3);  
endCol = round(segmentWidth * 1.4); 


roi = edgeImg(:, startCol:endCol);


pixelsum = sum(roi(:));
disp(['sum in ROI: ', num2str(pixelsum)]);


threshold = 150;


if pixelsum > threshold
    disp('Real Pakistani 1000 note');
else
    disp('Fake Pakistani 1000 note');
end


imshow(roi);


%}





