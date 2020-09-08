clc
clear
num=1;
t=0:1/107:8;
result(:,1)=t';
%%
plot(x)
ze=sd(find(fee==0));
x_z_0=x_z-ze;
lowerlimit= input('input the lower limit = ');
result(:,num+1)=x_z_0(lowerlimit:lowerlimit+856);
num=num+1;
%%
path='05mM_cooh_vibration.mat';
save(path,'result');