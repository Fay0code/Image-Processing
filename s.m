function s=s(In)
[X,Y]=size(In);  
r=zeros(1,256);
for i=1:X
    for j=1:Y
    r(In(i,j)+1)=r(In(i,j)+1)+1;
    end                   %计算rk的数目
end

%计算直方图密度
pro=r/(X*Y);

%计算累积直方图分布
s=zeros(1,256);
s(1)=pro(1);
for i=2:256  
   s(i)=s(i-1)+pro(i);
end

s=round(255.*s);

% plot(s);