%% OPENING / RUNNING SIMULATION
clc
%open('project_simu.slx')
%sim('project_simu.slx')
load('power_system_params')
%% Parameters :
%Filters = [9.03 14.75 13.03 17.85 5.37 3.19 6.3 16.61 17.68 16.73];
%Filters = [27.376 35.728 23.107 15.831 5.564 3.401 7.005 8.057 13.374 8.691];
Filters = [56.376 24.728 45.107 15.831 5.564 3.401 7.005 8.057 13.374 8.691];
f = Filters/mean(Filters);
Sb = 220e6;
Vb1 = 220e3;
Vb2 = 70e3;
Zb1 = Vb1^2/Sb;
Zb2 = Vb2^2/Sb;
S_railway = 15e6;
k = 0.8;
lines = lines_data;
m = 2; % C min or max
banks = 1e6*banks_data;
loads = zeros(10,2);
loads(1:9,:) = 1e6*[loads_data(:,2) loads_data(:,2).*sqrt(1-(loads_data(:,3)).^2)./loads_data(:,3)];
loads(10,:)  = [S_railway*k    S_railway*sqrt(1-k^2)];
%% Harmonic analysis
FFT1 = power_fftscope(PCC);
FFT1.input = 2;
FFT1.signal = 1;
FFT1.startTime = 0.1;
FFT1.cycles = 45;
FFT1.fundamental = 50;
FFT1.maxFrequency = 30*50;
FFT1.THDmaxFrequency = 50*50;
FFT1 = power_fftscope(FFT1);
harmonics = zeros(1,30);
for i = 1:length(harmonics)
    harmonics(i) = max(FFT1.mag((i-1)*45+1:i*45));
end
harmonics = harmonics*1/harmonics(2)*100;
harmonics(2) = 0;

%% Load flow
% stringa = 'ABC-DEF-HIJ-KLM';
% for i = 8
% spplot(V_lf(3*(i-1)+1,:),V_lf(3*(i-1)+2,:),V_lf(3*(i-1)+3,:));
% end