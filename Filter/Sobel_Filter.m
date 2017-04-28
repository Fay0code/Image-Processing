function Sobel_Filter
I=imread('Q3_1.tif');
f=double(I);%f(x,y)
h=[-1,0,1;-2,0,2;-1,0,1];%h(x,y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%frequency domain
fp=zeros(602,602); %fp(x,y)
for i=1:600
    for j=1:600
        fp(i,j)=f(i,j);
    end
end

hp=zeros(602,602);%hp(x,y)
for i=301:303
    for j=301:303
        hp(i,j)=h(i-300,j-300);
    end
end

X=602;
Y=602;


%%%%%%%%%%%%%%generate H(x,y)
hp1=hp; %第一步
for i=1:X
    for j=1:Y
        hp1(i,j)=hp(i,j)*(-1)^(i+j);
    end
end

hp2=fft2(hp1);   %正DFT

H=hp2-real(hp2);  %实部置零

for i=1:X
    for j=1:Y
        H(i,j)=H(i,j)*(-1)^(i+j);
    end
end

H=scale(H);
figure(4)
imshow(H);
%%%%%%%%%%%%%%%%%%%%%%generate F(x,y)
fp1=fp;  %第一步
for i=1:X
    for j=1:Y
        fp1(i,j)=fp(i,j)*(-1)^(i+j);
    end
end

F=fft2(fp1);%得到F(x,y)

%%%%%%%%%%%%%%%%%%%%
%得到频域的结果
G=H.*F;

%%%%%%%%%%%%
%处理后的图像
g1=real(ifft2(G));
for i=1:X
   for j=1:Y
    g1(i,j)=g1(i,j)*(-1)^(i+j);
   end
end

g1=g1(1:X-2,1:Y-2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%time domain
g2=conv2(f,h);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%scale
% scale
g1=scale(g1);
g2=scale(g2);
H=scale(H);


H=uint8(H);
figure(1)
imshow(H);
title('Filter shown as an image');

g1=uint8(g1);
figure(2)
imshow(g1);
title('Result of filtering Q3_1 in frequency domain');

g2=uint8(g2);
figure(3)
imshow(g2);
title('Result of filtering Q3_1 in time domain');


