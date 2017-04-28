function f=Remove_noise2(inputfile);
%获取整个图像的维度信息

% figure(1);
% imshow(inputfile);
inputfile=imread(inputfile);
inputfile=double(inputfile);
f=inputfile;

[R,C]=size(inputfile);
smin=3;
Smax=15;
dedu=(Smax-1)/2;

%加边框
I_New = zeros(R+dedu*2,C+dedu*2);    
I_New(1+dedu:R+dedu,1+dedu:C+dedu)=inputfile;


for i=1+dedu:R+dedu
    for j=1+dedu:C+dedu
        size_v=smin;
        while 1
        a=(size_v-1)/2;
        S=I_New(i-a:i+a,j-a:j+a);
        S=reshape(S,[1,size_v^2]);
        zmax=max(S);
        zmin=min(S);
        zmed=median(S);
        A1=zmed-zmin;
        A2=zmed-zmax;
        
        if((A1>0)&&(A2<0))
            B1=I_New(i,j)-zmin;
            B2=I_New(i,j)-zmax;
            
            if((B1>0)&&(B2<0))
                f(i-dedu,j-dedu)=I_New(i,j);
            else
                f(i-dedu,j-dedu)=zmed;
            end
            break;
        end
        size_v=size_v+2;
        
        if(size_v>=Smax)
            f(i-dedu,j-dedu)=zmed;
            break;
        end
        end
    end
end
    
f=uint8(f);
% figure(2)
% imshow(f);

end

