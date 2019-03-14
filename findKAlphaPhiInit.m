function kAlphaPhiInit = findKAlphaPhiInit(v, xy, LB_UB, params)
%
%   kALphaPhiInit = findKAlphaInitPhi(v, xy, LB_UB, params);
%
%  find appropriate wavenumber and direction estimates, k and alpha
%  based on the phase structure of the first EOF, v, at locations, xy.  
%  The estimate is done by modeling phase difference versus x and y
%  difference. dTheta = kx*dx + ky*dy.  This is done by extracting an x and 
%  y transect of phase and finding the median dPhasedx etc to remove phase
%  jumps.  This is done at multiple transects, taking the median of the
%  results. 

sliceFract = 0.1;   % define slices a this fraction nearest location
N = size(xy,1);
n = floor(sliceFract*N);
[~, ind] = sort(xy(:,2));       % sort everything in order of y
x = xy(ind,1);
phase = angle(v(ind));

% find kx estimate at n longshore locations then find median
for i = 1: floor(N/n)
    pick = (i-1)*n+1: i*n;
    [xp, xpInd] = sort(x(pick));
    phz = phase(pick(xpInd));
    kx(i) = median(diff(phz(:))./diff(xp(:)));
end
kx = median(kx);

% now find ky estimate at n cross-shore locations then find median
[~, ind] = sort(xy(:,1));       % sort everything in order of x
y = xy(ind,2);
phase = angle(v(ind));
for i = 1: floor(N/n)
    pick = [(i-1)*n+1: i*n];
    [yp, ypInd] = sort(y(pick));
    phz = phase(pick(ypInd));
    ky(i) = median(diff(phz(:))./diff(yp(:)));
end
ky = median(ky);
kVec = kx+1i*ky;
k = abs(kVec);              % magnitude of k
alpha = angle(kVec)-pi;     % switch by pi for 'coming from' angle
phi = mean(rem(phase - kx*xy(:,1) - ky*xy(:,2), 2*pi));

if ((k<LB_UB(1,1)) || (k>LB_UB(2,1)))    % if not in expected range
    k = dispsol(3.0, 0.1, 0);           % just guess a 0.1 Hz, h=3m value.
end

            
% this line forces alpha be between -pi and pi
% -- i.e., to hide the fact that the gradient walk circled the origin
%    multiple times?
alpha = mod(alpha+pi,2*pi)-pi;

phi=mod(phi,2*pi);

kAlphaPhiInit = [k alpha phi];
%
%   Copyright (C) 2017  Coastal Imaging Research Network
%                       and Oregon State University

%    This program is free software: you can redistribute it and/or  
%    modify it under the terms of the GNU General Public License as 
%    published by the Free Software Foundation, version 3 of the 
%    License.

%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.

%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see
%                                <http://www.gnu.org/licenses/>.

% CIRN: https://coastal-imaging-research-network.github.io/
% CIL:  http://cil-www.coas.oregonstate.edu
%
%key cBathy
%

