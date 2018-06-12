%Diana's June 5th cBathy demo based on processCBathyStack.m

clear;clc;close all;

datestr(now)
tic
stationStr = 'argus02b'; %eval(stationStr) creates the params structure.
stackName = 'C:\Users\ddileonardo\Documents\MATLAB\CIRN\FRF0306\processed\1497386580.Tue.Jun.13_20_43_00.GMT.2017.3DRSoloDumpster.cx.mBW.mat' ;  % load(stackName) -> load xyz, t, data
bathy = analyzeSingleBathyRunNotCIL(stackName, stationStr);
toc


plotBathyCollect(bathy) 

return
%load the data if the demo didn't work
load('1497386580.Tue.Jun.13_20_43_00.GMT.2017.3DRSoloDumpster.cx.cBathy.mat')


%%%%%%%%%%%%%%%%%%%%%
% params.xyMinMax = [80 800 475 1500];
% % debugging options
% params.debug.production = 0;        %Do you want a production run?
% params.debug.DOPLOTSTACKANDPHASEMAPS = 0;  % top level debug of phase
% params.debug.DOSHOWPROGRESS = 1;		  % show progress of tiles
% params.debug.DOPLOTPHASETILE = 0;		  % observed and EOF results per pt
% params.debug.TRANSECTX = 200;		  % for plotStacksAndPhaseMaps
% params.debug.TRANSECTY = 900;		  % for plotStacksAndPhaseMaps

% Inadequate data to analyze tile, [x,y] = [590, 1150]
% Inadequate data to analyze tile, [x,y] = [660, 1150]
% Elapsed time is 228.761714 seconds.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%[80 800 -500 1500];   % min, max of x, then y; original
%[80 800 300 1500]; %>1000 s; A = 720*1200 = 8.64e5
%[80 600 300 1500]; %>1200 s; A = 520*1200 = 6.24e5
%[80 600 -500 1500]; %>630 s
%[80 590 -500 1500]; %>578 s
%[80 800 450 1500]; %>519 s

%[80 800 475 1500]; %211 s
%[80 800 500 1500]; %210 S; A = 720*1000 = 7.2e5
%[80 575 -500 1500]; %197 s

%[80 550 -500 1500]; %189 s
%[80 500 -500 1500]; %172 s
%[80 500 -400 1500]; %173 s
%[80 500 -300 1500]; 172 s
%[80 500 -200 1500]; %172 s
%[80 500 -100 1500]; %174 s; A = 420*1600 = 6.72e5
%[80 500 0 1500]; %173 s; A = 420*1500 = 6.335
%[80 500 100 1500]; %173 s; A = 420*1400 = 5.88e5
%[80 500 200 1500]; %172 s; A = 420*1300 = 5.46e5
%[80 500 300 1500]; %172 s; A = 420*1200 = 5.04e5
%[80 500 300 1500]; %237 s;  (Matlab run & time)
%[80 800 500 1500]; %210 S; A = 720*1000 = 7.2e5
%[80 800 500 1400]; %210 s; A = 720*900 = 6.48e5
%[100 800 500 1400]; %200 seconds; A = 700*900 = 6.3e5