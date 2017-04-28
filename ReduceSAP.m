function [o_im]=ReduceSAP(inputfile,msize);
%获取整个图像的维度信息
[X,Y]=size(inputfile);

%根据窗口大小调整循环初始值
a=(msize-1)/2;
o_im=inputfile;
inputfile=double(inputfile);

%使用中位数窗口
for i=a+1:X-a
    for j=a+1:Y-a
        I=inputfile(i-a:i+a,j-a:j+a);
        s=median(median(I));
        o_im(i,j)=uint8(s);
    end
end

%做出图像
imshow(o_im);


end
