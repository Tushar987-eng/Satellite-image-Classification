load codebook.mat;
testim = imread('G:\Satellite-imagery-classification-master\testing2_8bit.png');
testim = im2double(testim); 
sizeC = size(C)
sizeim = size(testim)
tic
center = zeros(sizeim);
rgbdist = zeros(sizeim(1),sizeim(2),sizeC(1));
for j = 1:sizeim(1)
    for k = 1:sizeim(2)
        for i = 1:sizeC(1)
            rgbdist(j,k,i) = (testim(j,k,1)-C(i,1))^2 + ...
                (testim(j,k,2)-C(i,2))^2 + (testim(j,k,3)-C(i,3))^2;
        end
    end
    
end
[valmin posmin] = min(rgbdist,[],3);
csvwrite('csv_testing1', posmin);
C = [0 0 1; 1 0 0; 1 1 1; 0 1 0; 0.8 0.8 0.1; 0 0 0];
for i = 1:sizeim(1)
    for j = 1:sizeim(2)
        centnum = posmin(i,j); 
        cbrgb = C(centnum,:);
        for k = 1:sizeim(3)
            testim(i,j,k) = cbrgb(k);
            
        end
        
    end
end

toc

figure, imshow(testim);


