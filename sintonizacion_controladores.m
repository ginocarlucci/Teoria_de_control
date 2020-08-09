%Sintonizacion de controladores

% SISTEMA A CONTROLAR
num=[2580];
den=[12664 1];
H=[1]; %Realimentacion unitaria
FT=tf(num,den); %Funcion planta

%Retardo de transporte
[numR, denR]=pade(3,2)% Pade: Delay 
R=tf(numR,denR);
Gp = FT * R

% Veo si obtengo una respueta en forma de ese
figure(1);
step(Gp)

% Step response on the interval [0,8]
dt = 0.05;
t = 0:dt:8;
C = step(Gp, t);

% Derivatives (First and Second Order)
dC = diff(C)/dt;
d2C = diff(dC)/dt;

% Graph with Response and derivatives
figure(2);
hold on;
plot(C, '-r');
plot(dC, '-g');
plot(d2C, '-b');
legend('C(t)', 'dC(t)', 'd2C(t)');
hold off;
axis([0, 100, -0.25, 1]);

% Value and Position of 1st derivative's global maximum
[m, p] = max(dC);
tpi = t(p);

% Process Courve Reaction (PCR) Method* results:
% (*): PCR is the first Ziegler-Nichols Method
T = 0.99;
L = 6.1981;

% Controller's TF Open Loop (Gc) Approximation
kp = 1.2*(T/L);
Ti = 2*L;
Td = 0.5*L;
num = [kp*Td*Ti, kp*Ti, kp];
den = [Ti, 0];
Gc = tf(num, den);

% Controller's TF Closed Loop
% Feedback (H) = 1
hold on;
H = 1;
TFCL = feedback(Gc*Gp, H);

% First Improvement
kp1 = kp;
Td1 = 3*Td;
Ti1 = Ti; % Unchanged
num = [kp1*Td1*Ti1, kp1*Ti1, kp1];
den = [Ti1, 0];
Gc = tf(num, den);
TFCL2 = feedback(Gc*Gp, H);

% Second Improvement
kp2 = kp1; % Unchanged (respect to the last improvement)
Td2 = Td1; % Unchanged
Ti2 = 5*Ti; % Unchanged
num = [kp2*Td2*Ti2, kp2*Ti2, kp2];
den = [Ti2, 0];
Gc = tf(num, den);
TFCL3 = feedback(Gc*Gp, H);

figure(3);
step(TFCL, '-b', TFCL2, '-r', TFCL3, '-g');
legend('PID Z-N', 'PID 1st Improvement', 'PID 2nd Improvement');
title('PID Approximation and Improvements');

