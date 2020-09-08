%%ÿ�β����ǵø����ļ�����������
clear
clc
clc
clear
x=[];
n=1;
disp('�ǵø�����ȡ������')
%%
close all
x1=x(001:2500,2);
%x1=x1+10;
ad1='f:\';
ad2='Distribution of  oh 50mM-mpeg';
ad3='Spring constant of oh 50mM-mpeg';
ad4_1=num2str(n);
ad4_2='_3k';
ad4=[ad4_1,ad4_2];
ad5='.mat';
ad6='.fig';
xmin=min(x1);
x1=x1-xmin+0.01;
if rem(n,2)==0
close all
end%ͼ̫���ˣ�Ҫȥ��
if min(x1)==0.01
    disp('ȷ��Ҫ���б���У����~')
end
xmax=max(x1);%������ֵ���������������ź�
x_z=-100*log(x1./1497);%���źŻ���ɾ���
path1=[ad1,ad2,ad4,ad6];
path2=[ad1,ad3,ad4,ad6];
path3=[ad1,ad2,ad3,ad4,ad5];
stdz = std(x_z)
%springconstant_sd=4.11e-21/(sd*1e-9)^2
figure
subplot(2,2,1)
plot(x_z);%ͼ������Ϊ���ǿ�����ֵ���������
title('Vibration of bacteria')
ylabel('Z-coordinate (nm)')
xlabel('Number of frame')
subplot(2,2,2)%ͼ������Ϊ������ǿ�ȵ�������ĸ��ʷֲ����
n2=(max(x_z)-min(x_z))/60;
y=min(x_z):n2:max(x_z);
[fd,sd] = ksdensity(x_z,y);
plot(sd,fd);
title('Kernel smoothing function estimate for PDF')
xlabel('Z-coordinate (nm)')
ylabel('Probability')
subplot(2,2,3)%ͼ������Ϊ������ǿ�ȵ�������ĸ��ʷֲ����
histogram(x_z);
title('Frequency distribution')
xlabel('Z-coordinate (nm)')
ylabel('Number of points')
subplot(2,2,4)
ecdf(x_z);
[fc,sc]=ecdf(x_z);
title('Empirical cumulative distribution function')
xlabel('Z-coordinate (nm)')
saveas(gcf,path1)
fe=-log(fd);
fee= fe-min(fe);
feee=fee.*4.1124e-21;
ze=find(fee==0);

sdze=sd-sd(ze);
sdd=sdze*1e-9;
figure
subplot(2,2,1)
plot(sd,fee)% divide by kt(298K)
xlabel('Distance (nm)')
ylabel('\phi/KT(a.u.)')
xlim([0,700])
ylim([0,10])
set(gca,'FontName','Time New Romans','Fontsize',16)
subplot(2,2,2)
plot(sdd,feee,'LineWidth',2);
xlim([-1e-7,1e-7])
xlabel('Extension (m)')
ylabel('\phi(J)')
set(gca,'FontName','Time New Romans','Fontsize',16)
saveas(gcf,path2)
save(path3);
n=n+1