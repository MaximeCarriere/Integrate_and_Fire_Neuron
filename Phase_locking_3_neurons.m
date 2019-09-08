%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                   %        Neural Network         %
                   %         Phase Locking         %
                   %   Integrate and fire Neurons  %
                  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Numerical Integration with the Euler method
 
clear all;
close all;
hold off; 
clc;

%% parameters of the model
 dt=0.1;       % integration time step [ms]
 tau=10;       % time constant [ms]
 E_L=-65;      % resting potential [mV]
 theta=-55;    % firing threshold [mV]
 
 %% This is the external input current
 RI_ext=12;     % constant external input [mA/Ohm]
 
%% Integration with Euler method
 t_step=0; v1=E_L; v2=E_L; v3=E_L;
 
 w21 = 80;
 w31 = 30;
 
 w12 = 80;
 w32 = 30;
 
 w13 = 80;
 w23 = 30;
 
 s1 = 0;
 s2 = 0;
 s3 = 0;
 
 for t=0:dt:100;
     
     t_step=t_step+1;
     
     t1 = t;
     s1=v1>theta;
     v1=s1*E_L+ (1-s1)*(v1-dt/tau*((v1-E_L)-RI_ext-w21*s2-w31*s3));
     v1_rec(t_step)=v1;
     t1_rec(t_step)=t1;
     s1_rec(t_step)=s1;
     
     t2 = t;
     s2=v2>theta;
     v2=s2*E_L+ (1-s2)*(v2-dt/tau*((v2-E_L)-RI_ext-w12*s1-w32*s3));
     v2_rec(t_step)=v2;
     t2_rec(t_step)=t2;
     s2_rec(t_step)=s2;
     
     t3 = t;
     s3=v3>theta;
     v3=s3*E_L+ (1-s3)*(v3-dt/tau*((v3-E_L)-RI_ext-w13*s1-w23*s2));
     v3_rec(t_step)=v3;
     t3_rec(t_step)=t3;
     s3_rec(t_step)=s3;     
     
 end

 

%% Plotting results
 figure(1)   
 subplot('position',[0.13 0.13 1-0.26 0.6])
   plot(t1_rec,v1_rec);
   hold on; 
   plot(t2_rec,v2_rec);
   hold on; 
   plot(t3_rec,v3_rec);
   plot([0 100],[-55 -55],'--');
   axis([0 100 -66 -54]);
   xlabel('Time [ms]'); ylabel('v [mV]')
    

 subplot('position',[0.13 0.8 1-0.26 0.1])
   plot(t1_rec,s1_rec,'.','markersize',20);
   hold on;
   plot(t2_rec,s2_rec,'.','markersize',20);
   hold on;
   plot(t3_rec,s3_rec,'.','markersize',20);
   axis([0 100 0.5 1.5]); 
   set(gca,'xtick',[],'ytick',[])
   ylabel('Spikes')
%    
%  figure(2)   
%  subplot('position',[0.13 0.13 1-0.26 0.6])
%    plot(t2_rec,v2_rec);
%    hold on; plot([0 100],[-55 -55],'--');
%    axis([0 100 -66 -54]);
%    xlabel('Time [ms]'); ylabel('v [mV]')
% 
%  subplot('position',[0.13 0.8 1-0.26 0.1])
%    plot(t2_rec,s2_rec,'.','markersize',20);
%    axis([0 100 0.5 1.5]); 
%    set(gca,'xtick',[],'ytick',[])
%    ylabel('Spikes')
%    
%  figure(3)   
%  subplot('position',[0.13 0.13 1-0.26 0.6])
%    plot(t3_rec,v3_rec);
%    hold on; plot([0 100],[-55 -55],'--');
%    axis([0 100 -66 -54]);
%    xlabel('Time [ms]'); ylabel('v [mV]')
% 
%  subplot('position',[0.13 0.8 1-0.26 0.1])
%    plot(t3_rec,s3_rec,'.','markersize',20);
%    axis([0 100 0.5 1.5]); 
%    set(gca,'xtick',[],'ytick',[])
%    ylabel('Spikes')
