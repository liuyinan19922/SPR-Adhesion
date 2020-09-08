cd 'C:\Users\USER\Desktop\cooh05'
clc
clear
%%
allname=struct2cell(dir('*.fig'));
[k len]=size(allname);
%%
result=zeros(50,2*len)
for num=1:len
open(allname{1,num})
a=gca;
b=get(a,'children');
x=get(b,'XData');
x=x';
y=get(b,'YData');
y=y';
%cftool(x,y)
% x1=x{1,1};
% y1=y{1,1};
% y2=y{1,2};
x1=x;
y1=y;
result(1:length(x1),2*num-1)=x1';
result(1:length(x1),2*num)=y1';
%result(1:length(x1),3*num)=y2';
close
end
%%

[~,num]=size(result);
for k=1:num
    if rem(k,2)==0
      r=result(min(find(result(:,k)==0)),k-1);
      result(:,k-1)=result(:,k-1)-r
    end
end