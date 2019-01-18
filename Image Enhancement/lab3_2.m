im1 = imread('5941.tif');
im1 = rgb2gray(im1);
im2 = normrnd(128,128,100000,1);

hist1 = imhist(im1,256); %// Compute histograms
hist2 = hist(im2,256);

cdf1 = cumsum(hist1) / numel(im1); %// Compute CDFs
cdf2 = cumsum(hist2) / numel(im2);

%// Compute the mapping

for idx = 1 : 256
    [~,ind] = min(abs(cdf1(idx) - cdf2));
    ind;
    M(idx) = ind-1;
end
%{
output = im1;
for i = 1:256
     loc = im1 == i;
     output(loc) = M(i);
end
%}
out = M(double(im1)+1);
imshow(im1)
figure;
imshow(uint8(out));
figure;
imhist(im1);
figure;
imhist(uint8(out));

BW1 = edge(im1,'Canny',0.35);
BW2 = edge(uint8(out),'Canny',0.35);
imshow(BW1);
figure;
imshow(BW2);