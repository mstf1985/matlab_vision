[m n]=size(bw);
[cA1,cH1,cV1,cD1] = dwt2(bw,'bior3.7');
th=0.9;
cH=abs(cH1)-th;    %�þ���ȡ����ֵ��ȥ��ֵ
cH1=(cH>0).*cH1;   % cHԪ��>0����Ϊ1������Ϊ0������ԭ���ľ���.*���ɡ�
cV=abs(cV1)-th;  cV1=(cV>0).*cV1;
cD=abs(cD1)-th;  cD1=(cD>0).*cD1;
Xn= idwt2(cA1,cH1,cV1,cD1,'bior3.7');
figure(1);
subplot(121);imshow(bw);
subplot(122);imshow(Xn);
