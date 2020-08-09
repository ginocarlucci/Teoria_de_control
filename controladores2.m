%Controladores

hold on;
% SISTEMA A CONTROLAR
num=[2580];
den=[12664 1];
H=[1]; %Realimentacion unitaria
Gp=tf(num,den); %Funcion planta
FTLA=Gp %Funcion transferencia lazo abierto
FTLC=feedback(Gp,H) %Funcion transferencia lazo cerrado


%Funcion transferencia controlador proporcional
kp=2;
GcP=tf(kp)
FTLCp=feedback(Gp*GcP,H)
%Funcion transferencia controlador proporcional integral
kp=20;
ki=70;
num=[kp ki];
den=[1 0];
GcPI=tf(num,den)
FTLCpi=feedback(Gp*GcPI,H)
%Funcion transferencia controlador proporcional Derivativo
kp=20;
kd=10;
num=[kd kp];
den=[1];
GcPD=tf(num,den)
FTLCpd=feedback(Gp*GcPD,H)
%Funcion transferencia controlador proporcional Derivativo Integral
kp=20;
kd=30;
ki=70;
num=[kd kp ki];
den=[1 0];
GcPDI=tf(num,den)
FTLCpdi=feedback(Gp*GcPDI,H)
step(FTLCp, '-b', FTLCpd, '-g',FTLCpi, '-y',FTLCpdi, '-r')
legend('Proporcional', 'Proporcional Derivativo', 'Proporcional Integral', 'PID')
xlim([0, 15]);
ylim([0, 2]);
ylabel('Amplitud')
xlabel('Tiempo')

