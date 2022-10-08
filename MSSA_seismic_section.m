    clear all; close all; clc;
load('Sparker_seismic_data.mat');
load('Predicted_data.mat');
load('./BWR.mat');
nt_p=1601;

dt= 1.2500e-04;
t=0:dt:(nt_p-1)*dt; 
 
%%
%%
data_clim1=[-1 1];
meth=1;
P = 10;
flow = 1;
fhigh = 2000;
[SSA_O] = mssa_2d(Sparker_seismic_data,dt,P,flow,fhigh,meth);
[SSA_P] = mssa_2d(Predicted_data,dt,P,flow,fhigh,meth);
%%
figure(201);
set(gcf,'color',[1.0 1.0 1.0]);
    set(gcf,'units','normalized','outerposition',[0.1 0.05 0.5 0.65]);
tiledlayout(2,1,'TileSpacing','compact','Padding','compact'); 
nexttile; imagesc(D,t,SSA_O); caxis([data_clim1]);  colorbar()
        colormap(BWR);set(gca,'FontSize',10);
        xlabel('Distance (m)','FontSize',12)
        ylabel('Time (s)','Fontsize',12 );
        caxis([-1 1]) ;
nexttile; imagesc(D,t,SSA_P); caxis([data_clim1]); colorbar()
        colormap(BWR);set(gca,'FontSize',10);
        xlabel('Distance (m)','FontSize',12)
        ylabel('Time (s)','Fontsize',12 );
        caxis([-1 1])   
[F,~]=frame2im(getframe(gcf));    imwrite(F,[ './Proposed2.jpg']);

%%
figure(202);
set(gcf,'color',[1.0 1.0 1.0]);
    set(gcf,'units','normalized','outerposition',[0.1 0.05 0.22 0.5]);
tiledlayout(1,1,'TileSpacing','compact','Padding','compact');

nexttile; imagesc(D,t,SSA_O); caxis([data_clim1]);  colorbar()
        colormap(BWR);set(gca,'FontSize',10);
        xlabel('Distance (m)','FontSize',12)
        ylabel('Time (s)','Fontsize',12 );
          xlim([1100 1500]); ylim([0.1 0.2]) 
figure(203);
set(gcf,'color',[1.0 1.0 1.0]);
    set(gcf,'units','normalized','outerposition',[0.1 0.05 0.22 0.5]);
tiledlayout(1,1,'TileSpacing','compact','Padding','compact');
nexttile; imagesc(D,t,SSA_P); caxis([data_clim1]); colorbar()
        colormap(BWR);set(gca,'FontSize',10);
        xlabel('Distance (m)','FontSize',12)
        ylabel('Time (s)','Fontsize',12 );
         xlim([1100 1500]); ylim([0.1 0.2]) 