im=imread('img/car.jpg');
im=imresize(im,[480,NaN]);
imgray=rgb2gray(im);
imbin=imbinarize(imgray);
imedge=edge(imgray,'Sobel');
se=strel('diamond',2);
imdil=imdilate(imedge,se);
imFill=imfill(imdil,'holes');
se1=strel('diamond',10);
imErode=imerode(imFill,se1);
Iprops=regionprops(imErode,'BoundingBox','Area','Image');
area=Iprops.Area;
maxa=area;
count=numel(Iprops);
boundingbox=Iprops.BoundingBox;
for i=1:count
    if maxa<Iprops(i).Area
        maxa=Iprops(i).Area;
        boundingbox=Iprops(i).BoundingBox;
    end
end

imCrop=imcrop(imbin,boundingbox);
imres=imresize(imCrop,[240,NaN]);
imClear=imopen(imres,strel('rectangle',[4,4]));
imAlter=bwareaopen(~imClear,500);

% imAlter = bwmorph(imAlter, 'thin',6);
figure(12)
imshow(imAlter)
title('The altered image');

[h,w]=size(imAlter);

Iprops2=regionprops(imAlter,'BoundingBox','Area','Image');
count2=numel(Iprops2);
noPlate=[];
X = [];
for i=1:count2
    ow=length(Iprops2(i).Image(1,:));
    oh=length(Iprops2(i).Image(:,1));
    if (ow<h/2 && oh>h/3)
        a = floor(Iprops2(i).BoundingBox(1));
        b = floor(Iprops2(i).BoundingBox(2));
        c = Iprops2(i).BoundingBox(3);
        d = Iprops2(i).BoundingBox(4);
        imag = imAlter(b-10:b+d+10,a-10:a+c+10).*1;
        imag = imresize(imag, [20 20]);
        imshow(imag);
        imag = reshape(imag,[1 400]);
        X = [X;imag];
    end
end
