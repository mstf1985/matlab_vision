clear 
clc
load resp;
 fin=fopen('inputdata.txt','r');
I=fscanf(fin,'%f',27);                               %������Ծ�
x=fscanf(fin,'%f',28);
clocknum=3;
%�ڵ�λ��������ı仯����
y=resp(2:29,clocknum);
hold on;
grid on;
xlabel('�ڵ����꣨m��');
ylabel('�ڵ�λ�ƣ�m��');
title('�ڵ�λ��������ı仯����');
plot(x,y);
%�ڵ�ת��������仯����
z=resp(30:57,clocknum);
hold on;
grid on;
xlabel('�ڵ����꣨m��');
ylabel('�ڵ�ת�ǣ�m��');
title('�ڵ�ת��������ı仯����');
plot(x,z);