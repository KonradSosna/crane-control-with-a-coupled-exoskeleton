function Hd = ScurveDesign(tau,T)
% http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.1001.4723&rep=rep1&type=pdf
N = round((tau)/T) - 1;
if mod(N,2)
    N = N+1;
end
Fc = 2/(N+1);  % Cutoff Frequency
TM = 'Bandwidth';     % Transition Mode
BW = Fc;  % Bandwidth
DT = 'Normal';        % Design Type

% Create the window vector for the design algorithm.
win = rectwin(N+1);

% Calculate the coefficients using the FIR1 function.
b  = firrcos(N, Fc, BW, 2, TM, DT, [], win); % bylo firrcos
% Hd = dfilt.dffir(b);
Hd = b / sum(b);
% [EOF]
