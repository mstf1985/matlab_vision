load resp;
E=1.0e4;                                             %����ģ��
fin=fopen('inputdata.txt','r');
I=fscanf(fin,'%f',27);                               %������Ծ�
x=fscanf(fin,'%f',28);                               %�ڵ�����
for i=1:27
    L(i)=x(i+1)-x(i);                                %��Ԫ����
end
k=zeros(4,4,27);
for j=1:27
    k(:,:,j)=BeamElementStiffness(E,I(j),L(j));      %��Ԫj�ĸնȾ���
end
K=zeros(56,56);
for i=1:27
    K=BeamAssemble(K,k(:,:,i),i,i+1);                %����նȾ���
end
for j=1:1376                                         %����resp�ļ��е�λ�ƺ�ת�ǵ�u
    u(1,j)=resp(1,j);
    for i=2:29
        u(2*i-2,j)=resp(i,j);
    end
    for i=30:57
        u(2*i-57,j)=resp(i,j);
    end
end
for i=1:1376                                         %����ڵ��غ�
    f(:,i)=K*u(2:57,i);
end
t=resp(1,:);
%for i=1:28
    BeamElementMomentDiagramerro(f,t,1);
%end

