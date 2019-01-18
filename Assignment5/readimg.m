fid  = fopen('img/MS.img');
data = fread(fid,[1200*800*4], '*uint16');
fclose(fid)

img = reshape(data,1200,800,4);
%img = data';
%imshow(img(:,:,1),[])
B = uint8(img(:,:,1)/3.5);
G = uint8(img(:,:,2)/3.5);
R = uint8(img(:,:,3)/3.5);
%{
f_img(:,:,1) = B;
f_img(:,:,2) = G;
f_img(:,:,3) = R;
%}
f_img = cat(3,R,G,B);
imshow(f_img,[])