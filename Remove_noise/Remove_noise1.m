function f=Remove_noise1(inputfile,Q);
%��ȡ����ͼ���ά����Ϣ
inputfile=imread(inputfile);
%figure(1);
% imshow(inputfile);
[X,Y]=size(inputfile);
f=inputfile;
inputfile=double(inputfile);

%ʹ��3*3����
for i=2:X-1
    for j=2:Y-1
        I=inputfile(i-1:i+1,j-1:j+1);
        s1=sum(sum(I.^(Q+1)));
        s2=sum(sum(I.^Q));
        f(i,j)=uint8(s1/s2);
    end
end

%����ͼ��
% figure(2)
imshow(f);
end



