%TRABAJO PRACTICO INTEGRADOR - TEORIA DE CONTROL

% SISTEMA A CONTROLAR
num=[2580];
den=[12664 1];
H=[1]; %Realimentacion unitaria
Gp=tf(num,den); %Funcion planta
FTLA=Gp %Funcion transferencia lazo abierto
FTLC=feedback(Gp,H) %Funcion transferencia lazo cerrado

%Rta lazo abierto
figure(1)
step(FTLA, '-b')
title('Respuesta del sistema FTLA ante entrada escalon')
ylabel('Amplitud')
xlabel('Tiempo')

%Rta lazo cerrado
figure(2)
step(FTLC, '-b')
title('Respuesta del sistema FTLC ante entrada escalon')
ylabel('Amplitud')
xlabel('Tiempo')


