clc;
clear all;
close all;

im=imread('img/car4.jpg');
figure(1)
imshow(im)
title('Original image');
%Reading the image in the folder

im=imresize(im,[480,NaN]);
figure(2)
imshow(im)
title('resized image');
%Resize the image to 480 rows

imgray=rgb2gray(im);
figure(3)
imshow(imgray)
title('Gray image');
%Convert RGB image to gray

imbin=imbinarize(imgray);
figure(4)
imshow(imbin)
title('Binarized image');
%Binarize the image to 1s and 0s only.

imedge=edge(imgray,'Sobel');
figure(5)
imshow(imedge)
title('Edge detection in gray');
%Detecting edges in the graysacle image.

se=strel('diamond',2);
%Creating a structural element for screening.

imdil=imdilate(imedge,se);
figure(6)
imshow(imdil)
title('Dilated image from edge image');
%Dilating the edge image with the diamond structural element

imFill=imfill(imdil,'holes');
figure(7)
imshow(imFill)
title('Dilated image filled with holes');
%Filling the contours of the image with holes

se1=strel('diamond',10);
%Structural element of type diamond for erosion

imErode=imerode(imFill,se1);
figure(8)
imshow(imErode)
title('Eroded image from filled image');
%Eroding the filled image from the filled image

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
%Steps to find location of number plate

imCrop=imcrop(imbin,boundingbox);
figure(9)
imshow(imCrop)
title('The cropped out image form binary image');
%Cropping the image with the required licence plate region

imres=imresize(imCrop,[240,NaN]);
figure(10)
imshow(imres)
title('The resized licence plate');

imClear=imopen(imres,strel('rectangle',[4,4]));
figure(11)
imshow(imClear)
title('The dust cleared image');

imAlter=bwareaopen(~imClear,500);
figure(12)
imshow(imAlter)
title('The altered image');

[h,w]=size(imAlter);

Iprops2=regionprops(imAlter,'BoundingBox','Area','Image');
count2=numel(Iprops2);
noPlate=[];

for i=1:count2
    ow=length(Iprops2(i).Image(1,:));
    oh=length(Iprops2(i).Image(:,1));
    if (ow<h/2 && oh>h/3)
%         Iprops2(i).Image = imresize(Iprops2(i).Image, [20 20]);
        
        figure
        imshow(Iprops2(i).Image)
        title('Charachter Image');
    end
end
        




