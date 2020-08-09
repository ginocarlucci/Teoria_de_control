%Retardo de transporte

% SISTEMA A CONTROLAR
num=[2580];
den=[12664 1];
H=[1]; %Realimentacion unitaria
Gp=tf(num,den); %Funcion planta
FTLA=Gp %Funcion transferencia lazo abierto
FTLC=feedback(Gp,H) %Funcion transferencia lazo cerrado

%Retardo de transporte
[numR, denR]=pade(3,1)% Pade: Delay (coefficient = 0.5, Taylor polynomial: grade one)
R=tf(numR,denR);

%Rta lazo abierto con retardo de transporte
figure(1)
FTLAR=FTLA*R
step(FTLAR, '-b', FTLA, '-g')
legend('Retardo de transporte', 'Sin retardo')
title('Respuesta del sistema FTLA con retardo de transporte')
ylabel('Amplitud')
xlabel('Tiempo')

%Rta lazo cerrado con retardo de transporte
figure(2)
FTLCR=FTLC*R
step(FTLCR, '-b', FTLC, '-g')
legend('Retardo de transporte', 'Sin retardo')
title('Respuesta del sistema FTLC con retardo de transporte')
ylabel('Amplitud')
xlabel('Tiempo')



