function [o_im]=LocalHistEqu(inputfile,nsize)
I=imread(inputfile);
[X,Y]=size(I);
figure(1)
imshow(I);        %����ԭͼ
a=(nsize-1)/2;
%����һ���µľ��󣬷���ʹ��3*3���ڶ�ԭ�����Ե���ݽ��д���
I_New = zeros(X+2,Y+2);   
I_New(2:X+1,2:Y+1)=I;
I_New(1,2:Y+1)=I(1,:);
I_New(X+2,2:Y+1)=I(X,:);
I_New(2:X+1,1)=I(:,1);
I_New(2:X+1,Y+2)=I(:,Y);
I_New(1,1) = I(1,1);
I_New(1,X+2)=I(1,X);
I_New(X+2,1)=I(X,1);
I_New(X+2,X+2)=I(X,Y);
I_New=double(I_New);



for i=2:X+1       
    for j=2:Y+1
       S=s(I_New(i-a:i+1,j-a:j+a));  %����r��Ӧ���µ�sֵ
       o_im(i-1,j-1)=S(I(i-1,j-1)+1);  %sֵӳ���ԭͼ��
    end
end


o_im=uint8(o_im);
figure(2)
histogram(o_im)        %����ֱ��ͼ
figure(3)
imshow(o_im)       %����������ͼ��
end
