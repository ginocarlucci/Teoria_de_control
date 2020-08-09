% SISTEMA A CONTROLAR
num=[2580];
den=[12664 1];
H=[1]; %Realimentacion unitaria
Gp=tf(num,den); %Funcion planta

%Controlador PID
kp=20;
kd=30;
ki=70;
num=[kd kp ki];
den=[1 0];
GcPDI=tf(num,den)

FTLC=feedback(Gp*GcPDI,H) %Funcion transferencia lazo cerrado

%Agregado de compensador
z = [-5];
p = [-1];
k = 1;
[numcom,dencom] = zp2tf(z, p, k)
com = tf(numcom, dencom)
FTLA=Gp*com %Funcion transferencia lazo abierto
FTLCCOM = feedback(Gp*GcPDI*com,1)

%Respuestas con y sin compensador
figure(3)
step(FTLC, '-b',FTLCCOM, '-r')
ylim([0 1.5]);
legend('Sin compensador', 'Con compensador');
title('Respuesta del sistema con y sin compensador')
ylabel('Amplitud')
xlabel('Tiempo')

figure(4)
nyquist(FTLA)

