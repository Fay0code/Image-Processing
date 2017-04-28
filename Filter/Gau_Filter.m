function Gau_Filter(Do)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I=imread('Q3_2.tif');
[X,Y]=size(I);
f=double(I);    %Image
P=2*X;
Q=Y*2;

D=zeros(P,Q);
H=ones(P,Q);
%create D and H
for i=1:P
    for j=1:Q
        D(i,j)=sqrt((i-P/2)^2+(j-Q/2)^2);
        H(i,j)=exp(-D(i,j)^2/(2*Do^2));
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%% get F 
%change Image to frequency domain
fp=zeros(P,Q); %fp(x,y)
for i=1:P/2
    for j=1:Q/2
        fp(i,j)=f(i,j);
    end
end

for i=1:P
    for j=1:Q
        fp(i,j)=fp(i,j)*(-1)^(i+j);
    end
end

F=fft2(fp);%getF(x,y)


%%%%%%%%%%%%%%%%%%%%%%%%%%% process in frquency domain
G=H.*F;
G2=(1-H).*F;
% G=scale(G);
% 
% imshow(G);

%%%%%%%%%%%%
%处理后的图像
g1=real(ifft2(G));
for i=1:P
   for j=1:Q
    g1(i,j)=g1(i,j)*(-1)^(i+j);
   end
end

g1=g1(1:P/2,1:Q/2);

g2=real(ifft2(G2));
for i=1:P
   for j=1:Q
    g2(i,j)=g2(i,j)*(-1)^(i+j);
   end
end

g2=g2(1:P/2,1:Q/2);



%scale
g1=scale(g1);
g1=uint8(g1);
imshow(g1);

% %scale
% % g2=scale(g2);
% g2=uint8(g2);
% imshow(g2);
title('low pass');