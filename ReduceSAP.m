function [o_im]=ReduceSAP(inputfile,msize);
%��ȡ����ͼ���ά����Ϣ
[X,Y]=size(inputfile);

%���ݴ��ڴ�С����ѭ����ʼֵ
a=(msize-1)/2;
o_im=inputfile;
inputfile=double(inputfile);

%ʹ����λ������
for i=a+1:X-a
    for j=a+1:Y-a
        I=inputfile(i-a:i+a,j-a:j+a);
        s=median(median(I));
        o_im(i,j)=uint8(s);
    end
end

%����ͼ��
imshow(o_im);


end
