%% OPENING / RUNNING SIMULATION
clc
%open('project_simu.slx')
%sim('project_simu.slx')
load('power_system_params')
%% Parameters :
S_railway = 15e6;
k = 0.8;
lines = lines_data(:,[1 3 5]);
banks = 1e6*banks_data(:,2);
loads = zeros(10,2);
loads(1:9,:) = 1e6*[loads_data(:,2) loads_data(:,2).*sqrt(1-(loads_data(:,3)).^2)./loads_data(:,3)];
loads(10,:)  = [S_railway*k     S_railway*sqrt(1-k^2)];
%% Filter vs No Filter : PCC
% FIG(1) = figure;
% hold on; grid on;
% plot(Ipcc.Time,Ipcc.Data(:,1),'linewidth',0.9);
% %legend('phase a','phase b','phase c'); 
% xlabel('Time [s]'); ylabel('Current [pu]');
% 
% FIG(2) = figure;
% hold on; grid on;
% plot(Vpcc.Time,Vpcc.Data(:,1),'linewidth',0.9);
% %legend('phase a','phase b','phase c'); 
% xlabel('Time [s]'); ylabel('Voltage [pu]');
% %% Filter vs No Filter : H
% FIG(1) = figure;
% hold on; grid on;
% plot(IH.Time,IH.Data(:,:),'linewidth',0.9);
% %legend('phase a','phase b','phase c'); 
% xlabel('Time [s]'); ylabel('Current [pu]');
% 
% FIG(2) = figure;
% hold on; grid on;
% plot(VH.Time,VH.Data(:,:),'linewidth',0.9);
% %legend('phase a','phase b','phase c'); 
% xlabel('Time [s]'); ylabel('Voltage [pu]');
% %% Filter vs No Filter : E
% x = 'E';
% FIG(1) = figure;
% hold on; grid on;
% plot(IE.Time,IE.Data(:,:),'linewidth',0.9);
% %legend('phase a','phase b','phase c'); 
% xlabel('Time [s]'); ylabel('Current [pu]');
% a = strcat('I',x);
% FIG(2) = figure;
% hold on; grid on;
% plot(VE.Time,VE.Data(:,:),'linewidth',0.9);
% %legend('phase a','phase b','phase c'); 
% xlabel('Time [s]'); ylabel('Voltage [pu]');
%% Load flow
stringa = 'ABC-DEF-HIJ-KLM';
for i = 8
spplot(V_lf(3*(i-1)+1,:),V_lf(3*(i-1)+2,:),V_lf(3*(i-1)+3,:));
end