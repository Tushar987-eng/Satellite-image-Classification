train = imread('G:\Satellite-imagery-classification-master\train2_8bit.png');
train = im2double(train);
train = imresize(train, 0.3);
[m,n,k] = size(train);
red = train(:,:,1);
green = train(:,:,2);
blue = train(:,:,3);
red = red(:);
green = green(:);
blue = blue(:);
im = [red(:) green(:) blue(:)];
[IDX, C] = kmeans(im, 6);  
C255 = C * 255; 
save('codebook', 'C');
im = double(im);
for i = 1:5
    pp = find(IDX==i);
    avg = mean(im(pp,:));
    for j = 1:length(pp)
        im(pp(j),:) = avg;
    end
end
red = im(:,1);
green = im(:,2);
blue = im(:,3);
red = reshape(red,m,n);
green = reshape(green,m,n);
blue = reshape(blue,m,n);
train(:,:,1) = red;
train(:,:,2) = green;
train(:,:,3) = blue;
figure,
imshow(train);

















