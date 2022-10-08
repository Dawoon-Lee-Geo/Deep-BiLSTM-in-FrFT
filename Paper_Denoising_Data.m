clear all; close all; clc;
load('Trace_data.mat'); 
%% 

f_p2=-0.25:0.01:0.25;
f_p=rad2deg(pi/2.*[-0.25:0.01:0.25]);
nrec=8;

nt_p=1601;
dt= 1.2500e-04;
t=0:dt:(nt_p-1)*dt;
nt=length(t);
Fs=1/dt;FFT_size=2^20;df=Fs/FFT_size;freq_idx=0:df:Fs-df;

perc=0.10; 

figure(1);
set(gcf,'color',[1.0 1.0 1.0]);
set(gcf,'units','normalized','outerposition',[0.1 0.05 0.8 0.35]);
tiledlayout(1,3,'TileSpacing','compact','Padding','compact');
koko=[139 346 552];
 
for ik=1:3
    ndata=complex(zeros(length(f_p2),nt_p),0);
    origin_data=Original_trace([1:nt_p],ik);
    for ii=1:length(f_p2)
        f_power=f_p2(ii);
        c=frft(origin_data,f_power);
        ndata(ii,:)=c;
    end


    [rho, theta] = meshgrid(t,f_p);
    [X,Y] = pol2cart(theta*pi/180,rho);
    nexttile;
    S1 = surf(X,Y,real(ndata)); grid off; colorbar();
    S1.EdgeColor = 'none';
    view([0 90]);
    xlim([-0.01 max(t)])
    colormap('jet'); caxis([-2 2]);
    set(gca,'xtick',[],'ytick',[]);
    b=xlabel('Time');a=ylabel('Freqeuncy'); set(gca,'FontSize',10);
    ax1 = gca; % current axes
    ax1.YAxisLocation = 'origin';
    ax1.XAxisLocation = 'origin';
    set(a,'rotation',90)
    a.Position(1)=-0.01;
    a.Position(2)=0.03;

    b.Position(1)=0.018;
    b.Position(2)=-0.02;

end 



figure(2);
set(gcf,'color',[1.0 1.0 1.0]);
set(gcf,'units','normalized','outerposition',[0.1 0.05 0.8 0.35]);
tiledlayout(1,3,'TileSpacing','compact','Padding','compact');
 

for ik=1:3
    ndata=complex(zeros(length(f_p2),nt_p),0);
    origin_data=Predicted_trace([1:nt_p],ik);
    for ii=1:length(f_p2)
        f_power=f_p2(ii);
        c=frft(origin_data,f_power);
        ndata(ii,:)=c;
    end


    [rho, theta] = meshgrid(t,f_p);
    [X,Y] = pol2cart(theta*pi/180,rho);
    nexttile;
    S1 = surf(X,Y,real(ndata)); grid off; colorbar();
    S1.EdgeColor = 'none';
    view([0 90]);
    xlim([-0.01 max(t)])
    colormap('jet'); caxis([-2 2]);
    set(gca,'xtick',[],'ytick',[]);
    b=xlabel('Time');a=ylabel('Freqeuncy'); set(gca,'FontSize',10);
    ax1 = gca; % current axes
    ax1.YAxisLocation = 'origin';
    ax1.XAxisLocation = 'origin';
    set(a,'rotation',90)
    a.Position(1)=-0.01;
    a.Position(2)=0.03;

    b.Position(1)=0.018;
    b.Position(2)=-0.02;

end 


%%

figure(3);
set(gcf,'color',[1.0 1.0 1.0]);
set(gcf,'units','normalized','outerposition',[0.1 0.05 0.9 0.35]);
tiledlayout(1,3,'TileSpacing','compact','Padding','compact');
 
for ik=1:3

    origin_data=Original_trace([1:nt_p],ik);
    nexttile;
    plot(t,origin_data,'k-')
    xlim([0 max(t)])  ;ylim([-20 20]);
    b=xlabel('Time (s)');a=ylabel('Amplitude'); set(gca,'FontSize',10);
end 


figure(4);
set(gcf,'color',[1.0 1.0 1.0]);
set(gcf,'units','normalized','outerposition',[0.1 0.05 0.9 0.35]);
tiledlayout(1,3,'TileSpacing','compact','Padding','compact');
 
for ik=1:3

    origin_data=Predicted_trace([1:nt_p],ik);
    nexttile;
    plot(t,origin_data,'k-')
    xlim([0 max(t)])  ;ylim([-20 20]);
    b=xlabel('Time (s)');a=ylabel('Amplitude'); set(gca,'FontSize',10);
end 


