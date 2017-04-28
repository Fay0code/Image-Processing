function [o_im,o_hist]=HistEqu(inputfile)
o_im=imread(inputfile);
% figure(1)
% imshow(o_im);        %画出原图
[X,Y]=size(o_im);
 %利用s函数进行rk的概率统计，以及直方图计算
 %返回的o_hist是直方图均衡变换函数的值s
o_hist=s(o_im);

%将s的值返回到对应的r上
for i=1:X
    for j=1:Y
        o_im(i,j)=o_hist(o_im(i,j)+1);
    end
end

o_im=uint8(o_im);  
% figure(2)
% histogram(o_im);      画直方图分布
% figure(3)
% imshow(o_im)       画均衡以后的图像



