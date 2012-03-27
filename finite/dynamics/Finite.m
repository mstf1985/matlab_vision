tic
load resp;
n=28;                                                %�ڵ���Ŀ
m=27;                                                %��Ԫ��Ŀ
T=1376;                                              %ʱ������
E=1.0e4;                                             %����ģ��
fin=fopen('inputdata.txt','r');
I=fscanf(fin,'%f',m);                               %������Ծ�
x=fscanf(fin,'%f',n);                               %�ڵ�����
for i=1:m
    L(i)=x(i+1)-x(i);                                %��Ԫ����
end
k=zeros(4,4,m);
for j=1:m
    k(:,:,j)=beamelementstiffness(E,I(j),L(j));      %��Ԫj�ĸնȾ���
end
for j=1:T                                         %����resp�ļ��е�λ�ƺ�ת�ǵ�u
    u(1,j)=resp(1,j);
    for i=2:n+1
        u(2*i-2,j)=resp(i,j);
    end
    for i=n+2:2*n+1
        u(2*i-2*n-1,j)=resp(i,j);
    end
end
f=zeros(2*n+1,T);
for i=1:T                                            %����ڵ��غ�
    f1(1,i)=resp(1,i);
    f(1,i)=resp(1,i);
    for j=1:m
        f1(4*j-2:4*j+1,i)=k(:,:,j)*u(2*j:2*j+3,i);
    end
    for j=1:m
        f(2*j:2*j+1,i)=f1(4*j-2:4*j-1,i);            %ȡ��ڵ�Ϊ�ýڵ�����
    end
    f(2*n:2*n+1,i)=f1(4*m:4*m+1,i);
end
node=28;                                            %�û�ָ���ڵ�
clocknum=3;                                         %�û�ָ��ʱ��
clock=resp(1,clocknum);
for i=1:27
    output(i,:)=f1(4*i-2:4*i+1,clocknum);
end
savefile='forceandmomentdata.mat';
save(savefile,'output');
t=resp(1,:);
beamelementmomentdiagram(f,t,node);
figure;
beamelementmomentdiagramwithlength(f,x,clocknum,n);
toc