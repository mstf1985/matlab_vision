%ʶ��һ��ͼ�������Բ��ʮ�֣�Ҫ�󲻴�����ȫ��ϵ�ͼ�Σ���ͬ��ͼƬѡȡ�ʵ��ķ�ֵ��ʮ�ֺ�Բ��Ҫ��̫��
tic
image=imread('right1.jpg');
image=rgb2gray(image);
bw=edge(image,'sobel');
se=strel('disk',1);
bw=imdilate(bw,se);
[L,num]=bwlabel(bw,4);                                  %��ͬ�ĵ�ͼ�μӱ�ǩ1~N
thresh=100;
sectiondim=550;%���ʮ�ֺ�Բ�ķ�ֵ��hough�任��
[flag,shape,sectionnum,sectionlabel]=identifypurple(L,num,thresh,sectiondim);                    %ʶ��ͬͼ�ε���״
[Xcross,Ycross]=houghcross(L,flag ,sectionnum,sectionlabel);                %�ҵ�ʮ�ֵĽ���
[Xcircle,Ycircle]=houghcircle(L,flag,sectionnum,sectionlabel);%�ҵ�Բ��
dis=calculate(fc,cc,Rc_ext, Tc_ext,Xcircle,Ycircle);
toc
