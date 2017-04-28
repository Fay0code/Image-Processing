function [o_im,o_hist]=HistMatch(inputfile,spec_hist);
o_im=imread(inputfile);
[X,Y]=size(o_im);
% figure(1)
% imshow(o_im);        %画出原图
[X1,S]=HistEqu_11410563(inputfile);  %由给定的输入图像得到s


%原图像中的z的概率
pro=spec_hist/sum(spec_hist);

%求G
G=[pro(1),zeros(1,255)];
for i=2:255
    G(i)=G(i-1)+pro(i);
end
G=round(255.*G);

o_hist=zeros(1,length(S));
for i=1:length(S)
   [x,o_hist(i)]=min(abs(G-S(i)));     %求出每个s对应的z值
end                   
 
%z值映射回原图中
for i=1:X
    for j=1:Y
        o_im(i,j)=o_hist(o_im(i,j)+1)-1;
    end
end

o_im=uint8(o_im);

figure(2)
histogram(o_im);
figure(3)
imshow(o_im);



