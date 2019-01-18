img = imread('MS.tif');

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

newR = imadjust(R);
newG = imadjust(G);
newB = imadjust(B);


newimg(:,:,1) = newR;
newimg(:,:,2) = newG;
newimg(:,:,3) = newB;
imshow(newimg)
