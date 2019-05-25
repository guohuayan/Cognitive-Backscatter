close all
clear all

load('CBN_P_20_eta_20_resp.mat','P','eta','rate','r1','R2','rsm','rcm');
figure
plot(rate(1,:),rate(2,:),'r--','linewidth',1.5);
hold on
xlabel('R_{s} (bps/Hz)');ylabel('R_{c} (bps/Hz)');
plot(r1,R2,'r-','linewidth',1.5);
plot(rsm,rcm,'r-.','linewidth',1.5);
axisx=rate(1,2);axisy=rate(2,1);
plot(axisx,0,'k.','linewidth',1.5,'markersize',20);
plot(0,axisy,'k.','linewidth',1.5,'markersize',20);
plot(rsm(end),0,'k.','linewidth',1.5,'markersize',20);
grid on
load('CBN_P_20_eta_25_resp.mat','P','eta','rate','r1','R2','rsm','rcm');
plot(rate(1,:),rate(2,:),'--b','linewidth',1.5);
plot(r1,R2,'b-','linewidth',1.5);
plot(rsm,rcm,'b-.','linewidth',1.5);
plot(rsm(end),0,'k.','linewidth',1.5,'markersize',20);
load('CBN_P_15_eta_20_resp.mat','P','eta','rate','r1','R2','rsm','rcm');
plot(rate(1,:),rate(2,:),'--m','linewidth',1.5);
plot(r1,R2,'m-','linewidth',1.5);
plot(rsm,rcm,'m-.','linewidth',1.5);
axisx=rate(1,2);axisy=rate(2,1);
plot(axisx,0,'k.','linewidth',1.5,'markersize',20);
plot(0,axisy,'k.','linewidth',1.5,'markersize',20);
plot(rsm(end),0,'k.','linewidth',1.5,'markersize',20);
%%
ylim([0,1]);
% h=semilogy(r1,-1.*ones(size(r1)),'r-',r1,-1.*ones(size(r1)),'r-.',r1,-1.*ones(size(r1)),'r--',...
%     r1,-1.*ones(size(r1)),'b-',r1,-1.*ones(size(r1)),'b-.',r1,-1.*ones(size(r1)),'b--',...
%     r1,-1.*ones(size(r1)),'m-',r1,-1.*ones(size(r1)),'m-.',r1,-1.*ones(size(r1)),'m--','Linewidth',1.1);
% legend(h,{'P=20 dB \eta= -20 dB (CBN)','P=20 dB \eta= -20 dB (CBN \omega=1)','P=20 dB \eta= -20 dB (TDMA)',...
%     'P=20 dB \eta= -25 dB (CBN)','P=20 dB \eta= -25 dB (CBN \omega=1)','P=20 dB \eta= -25 dB (TDMA)',...
%     'P=15 dB \eta= -20 dB (CBN)','P=15 dB \eta= -20 dB (CBN \omega=1)','P=15 dB \eta= -20 dB (TDMA)'},'FontSize',10,'location','northeast');
h=semilogy(r1,-1.*ones(size(r1)),'k-',r1,-1.*ones(size(r1)),'k-.',r1,-1.*ones(size(r1)),'k--',...
'Linewidth',1.1);
legend(h,{'CBN','CBN \omega=1','TDMA',...
    },'FontSize',10,'location','northeast');
fs=12;
text(0.8,0.1,'P=15 dB \eta= 0.5','Color','m','FontSize',fs);
text(0.3,0.45,'P=20 dB \eta= 0.16','Color','b','FontSize',fs);
text(4,0.7,'P=20 dB \eta= 0.5','Color','r','FontSize',fs);
% text(0.8,0.1,'P=15 dB \eta= -3 dB','Color','m','FontSize',fs);
% text(0.3,0.45,'P=20 dB \eta= -8 dB','Color','b','FontSize',fs);
% text(4,0.7,'P=20 dB \eta= -3 dB','Color','r','FontSize',fs);


