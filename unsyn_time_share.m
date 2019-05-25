%% decode s first
close all
clear all

P=15;
% N=10;
eta=-20;
%%
P_t=10.^(P./10);
eta_t=10.^(eta./10);
h1=1;
h2=1;
h1=abs(h1)^2;h2=abs(h2).^2.*eta_t;
R1m=log2(1+P_t.*h1);
ite=1e4;
% r1=linspace(0,R1m,ite);
%% TDMA
R1=log2(1+P_t.*h1);
R2=log2(1+P_t.*h2);
rate = [[0;R2],[R1;0]];
figure
plot(rate(1,:),rate(2,:),'-bs','linewidth',1.5);
hold on
xlabel('R_{s} (bps/Hz)');ylabel('R_{c} (bps/Hz)');
%% suboptimal time share
d1=P_t*h1;d2=P_t*h2;
% itex=1e5;
xm=log2(1+d1/(1+d2));
x=linspace(0,xm,4);
while(1)
    z2=1./(R1m-x).*log2(d1.*(1+d2)./(d1+d2.*(1+d2).*(2.^x-1)));
    [zm,z_index]=max(z2);
    if z_index==1 || z_index==4
        xo=x(z_index);
        break
    elseif abs(x(4)-x(1))<1e-7
        xo=x(z_index);
        break
    else
        x=linspace(x(z_index-1),x(z_index+1),4);
    end
end
r1=linspace(0,R1m,ite);
R2=zeros(1,ite);
t_sub=zeros(1,ite);
rho_sub=zeros(1,ite);
parfor i0=1:ite
       rt=r1(i0);
       if rt<xo
           rho=(2^rt-1)/d1*(1+d2);
           tau=1;
       else
           rho=(2^xo-1)/d1*(1+d2);
           tau=(R1m-rt)/(R1m-xo);
       end
%        rht=log2(1+rho*d1./(1+d2));
       rct=log2((1+d2)/(1+rho*d2));
       R2(i0)=tau*rct;
       t_sub(i0)=tau;
       rho_sub(i0)=rho;
end
plot(r1,R2,'r-','linewidth',1.5);
grid on
%%
rho=linspace(0,1,1e4);
rsm=log2(1+rho.*d1/(1+d2));
rcm=log2((1+d2)./(1+d2.*rho));
plot(rsm,rcm,'m--','linewidth',1.5);
%%
% save('CBN_P_15_eta_20.mat','P','eta','rate','r1','R2');
%%
save('CBN_P_15_eta_20_resp.mat','P','eta','rate','r1','R2','rsm','rcm');
%%



