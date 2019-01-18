histogram_t = [0 7 4 4 2 2 0 0 0 0 2 4 3 2 6 0];
temp = 1;
for i = 1:length(histogram_t)
    for j = 1:histogram_t(i)
        o(temp) = i;
        temp = temp+1;
    end
end
b = normrnd(8,2,100000,1);

output = zeros(16,1);
im1 = o;
im2 = b;

xbins1 = 1:16;
hist1 = hist(o,xbins1);
hist2 = hist(b,xbins1);


%hist1 = imhist(im1,16); %// Compute histograms
%hist2 = imhist(im2,16);
cdf1 = cumsum(hist1) / numel(im1); %// Compute CDFs
cdf2 = cumsum(hist2) / numel(im2);

%// Compute the mapping
for idx = 1 : 16
    [~,ind] = min(abs(cdf1(idx) - cdf2));
    ind;
    M(idx) = ind;
end

for i = 1:16
     loc = o == i;
     output(loc) = M(i);
end
%// Now apply the mapping to get first image to make
%// the image look like the distribution of the second image
%out = M(double(im1)+1);

%pdf of gaussian & original
[f,xi] = ksdensity(o);
plot(xi,f);
figure;
[f,xi] = ksdensity(b);
plot(xi,f);
title('Probability density functions of Gaussian')
xlabel('Brightness');
ylabel('Density');

%cdf
figure;
plot(cdf1,'bo--');
title('Cumulative histogram of Source data');
xlabel('Brightness');
ylabel('Density');

figure;
plot(cdf2,'ko--'),;
title('Cumulative histogram of Gaussian with Mean = 2 & Std = 2');
xlabel('Brightness');
ylabel('Density');

figure;
plot(cdf1,'bo--');
hold on;
plot(cdf2,'ko--'),;
title('Histogram Matching');
xlabel('Brightness');
ylabel('Density');
legend('Source Image','Gaussian');

figure;
h = hist(output,1:16);
bar(h,0.4)
axis([1,17,0,12])
title('Matching Result');
xlabel('Brightness value');
ylabel('number of pixels');
%h = findobj(gca,'Type','patch');
%h.FaceColor = [0 0.5 0.5];
%h.EdgeColor = 'w';


