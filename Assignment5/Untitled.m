rows = 1200;
cols = 800;
bands = 4;
im1 = multibandread('MS.img', [rows cols bands],'uint16', 74880, 'bsq', 'ieee-le',{'Band','Direct',[3 2 1]});
imwrite(uint16(im1(:,:,1:3)),'test.tif')