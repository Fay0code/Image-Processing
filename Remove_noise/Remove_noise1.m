function f=Remove_noise1(inputfile,Q);
%获取整个图像的维度信息
inputfile=imread(inputfile);
%figure(1);
% imshow(inputfile);
[X,Y]=size(inputfile);
f=inputfile;
inputfile=double(inputfile);

%使用3*3窗口
for i=2:X-1
    for j=2:Y-1
        I=inputfile(i-1:i+1,j-1:j+1);
        s1=sum(sum(I.^(Q+1)));
        s2=sum(sum(I.^Q));
        f(i,j)=uint8(s1/s2);
    end
end

%做出图像
% figure(2)
imshow(f);
end



