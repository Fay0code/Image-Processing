function Butterworth notch filters
I=imread('Q3_3.tif');
figure(1);
imshow(I);
[X,Y]=size(I);
f=double(I);
P=2*X;
Q=2*Y;

Do=20;
n=4;
for i=1:4
    D(i,:,:)=zeros(P,Q);
    DN(i,:,:)=zeros(P,Q);
end
H=ones(P,Q);
vk=[183,180,300,303];
vk=vk-P/2;
uk=[90,20,20,85];
uk=uk-Q/2;
%create  Hk
for i=1:P
    for j=1:Q
        for z=1:4
%             z=4;
            D(z,i,j)=sqrt((i-P/2-uk(z))^2+(j-Q/2-vk(z))^2);
            DN(z,i,j)=sqrt((i-P/2+uk(z))^2+(j-Q/2+vk(z))^2); 
            H(i,j)=H(i,j)*(1/(1+(Do/D(z,i,j))^(2*n)))*(1/(1+(Do/DN(z,i,j))^(2*n)));
        end
    end
end



%%%%%%%%%%%%%%%%%%%%%%%%% get F 
% change Image to frequency domain
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


F=scale(F);
% F=uint8(F);
figure(2)
imshow(F)


% %%%%%%%%%%%%%%%%%%%%%%%%%%% process in frquency domain
G=H.*F;
G=scale(G);
% G=uint8(G);
figure(3)
imshow(G);

%%%%%%%%%%%%
%处理后的图像
g1=real(ifft2(G));
for i=1:P
   for j=1:Q
    g1(i,j)=g1(i,j)*(-1)^(i+j);
   end
end

g1=g1(1:P/2,1:Q/2);

figure(4)
g1=scale(g1);
g1=uint8(g1);
imshow(g1);


