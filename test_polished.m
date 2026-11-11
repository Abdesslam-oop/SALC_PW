%% SALC1 - TP1: Analysis of Dynamic Systems using MATLAB
% Time-domain analysis: step responses, poles, and impulse responses.
% The original transfer-function coefficients and calculation workflow
% have been preserved; only comments and figure presentation are improved.

clc;
clear;
close all;

%% 1. Definition of the transfer functions

% System F(s)
num = 10;
den = [1 2 10];
printsys(num, den);

% Common time vector for all simulations
t = 0:0.1:10;

% System H(s)
num1 = 15;
den1 = [1 1 15];

% System G(s)
num2 = [9 2];
den2 = [1 0.8 5 1];

% System T(s)
num3 = [1 1];
den3 = [1 2 2 7];

%% 2. Unit-step responses

% Compute the unit-step response of each system
y  = step(num,  den,  t);
y1 = step(num1, den1, t);
y2 = step(num2, den2, t);
y3 = step(num3, den3, t);

% Plot all four responses on the same figure for comparison
figure('Name', 'Unit-Step Responses', 'NumberTitle', 'off');

plot(t, y,  'b', 'LineWidth', 1.5);
hold on;
plot(t, y1, 'g', 'LineWidth', 1.5);
plot(t, y2, 'r', 'LineWidth', 1.5);
plot(t, y3, 'm', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Unit-Step Responses of the Four Systems');
legend('F(s)', 'H(s)', 'G(s)', 'T(s)', 'Location', 'best');

hold off;

%% 3. Calculation of system poles

% The roots of each denominator polynomial correspond to
% the poles of the associated transfer function.

disp('Poles of F(s):');
roots(den)

disp('Poles of H(s):');
roots(den1)

disp('Poles of G(s):');
roots(den2)

disp('Poles of T(s):');
roots(den3)

%% 4. Impulse-response comparison

% Define the additional system
num4 = 1;
den4 = [1 4 3];

% Compute impulse responses
y4 = impulse(num4, den4, t);
y5 = impulse(num, den, t);

% Compare the impulse responses of the two systems
figure('Name', 'Impulse Responses', 'NumberTitle', 'off');

plot(t, y4, 'b', 'LineWidth', 1.5);
hold on;
plot(t, y5, 'r', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Impulse-Response Comparison');
legend('System 1: 1/(s^2 + 4s + 3)', ...
       'System F(s): 10/(s^2 + 2s + 10)', ...
       'Location', 'best');

hold off;

%% 5. Comparison with the unit-step input

% Define another transfer function
num5 = [2 1];
den5 = [1 6 5];

% Compute the system response to a unit-step input
y6 = step(num5, den5, t);

% Generate the unit-step input signal.
u_step = step(1, 1, t);

% Plot the system response and the input signal
figure('Name', 'System Response and Unit-Step Input', ...
       'NumberTitle', 'off');

plot(t, y6, 'b', 'LineWidth', 1.5);
hold on;
plot(t, u_step, 'k--', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('System Response Compared with the Unit-Step Input');
legend('System response', 'Unit-step input', 'Location', 'best');

hold off;
