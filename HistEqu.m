function [o_im,o_hist]=HistEqu(inputfile)
o_im=imread(inputfile);
% figure(1)
% imshow(o_im);        %����ԭͼ
[X,Y]=size(o_im);
 %����s��������rk�ĸ���ͳ�ƣ��Լ�ֱ��ͼ����
 %���ص�o_hist��ֱ��ͼ����任������ֵs
o_hist=s(o_im);

%��s��ֵ���ص���Ӧ��r��
for i=1:X
    for j=1:Y
        o_im(i,j)=o_hist(o_im(i,j)+1);
    end
end

o_im=uint8(o_im);  
% figure(2)
% histogram(o_im);      ��ֱ��ͼ�ֲ�
% figure(3)
% imshow(o_im)       �������Ժ��ͼ��



