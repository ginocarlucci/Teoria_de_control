%BODE AND NYQUIST

% SISTEMA A CONTROLAR
num=[2580];
den=[12664 1];
Gp=tf(num,den); %Funcion planta
FTLA=Gp %Funcion transferencia lazo abierto

figure(1);
bode(FTLA);
title('Bode Diagram');
figure(2)
pzmap(FTLA)
% Nyquist Diagram, Stability Analysis
figure(3);
nyquist(FTLA);
title('Nyquist Diagram');