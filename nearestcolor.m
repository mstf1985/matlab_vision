indexmap=[0.451,0.0196,0.6118;1,1,1;0.6392,0.2863,0.6431];
rgb=imread('purple.png');
x=rgb2ind(rgb,indexmap);
imshow(x,indexmap);