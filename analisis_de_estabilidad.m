%Analisis de estabilidad

% SISTEMA A CONTROLAR
num=[2580];
den=[12664 1];
H=[1]; %Realimentacion unitaria
Gp=tf(num,den); %Funcion planta

%Funcion transferencia controlador proporcional
kp=30;
GcP=tf(kp)
%Funcion transferencia lazo abierto
FTLAp=Gp*GcP
%Lugar geometrico de las raices
figure(1)
rlocus(FTLAp);
%Ganancia k1
kp1=kp*1.5
GcP=tf(kp1);
FTLCp1 = feedback(GcP*Gp, H);
%Ganancia k2
kp2=kp*5
GcP=tf(kp2);
FTLCp2 = feedback(GcP*Gp, H);
%Ganancia k3
kp3=kp*10
GcP=tf(kp3);
FTLCp3 = feedback(GcP*Gp, H);
figure(2)
step(FTLCp1, '-b',FTLCp2, '-g',FTLCp3, '-r')
legend('kp*1.5', 'kp*5', 'kp*10');


% %Funcion transferencia controlador proporcional Derivativo
% kp=30;
% kd=10;
% %Funcion transferencia controlador proporcional Derivativo
% num=[kd kp];
% den=[1];
% GcPD=tf(num,den)
% %Funcion transferencia lazo abierto y cerrado
% FTLCpd=feedback(Gp*GcPD,H)
% FTLApd=Gp*GcPD
% %Lugar geometrico de las raices
% figure(1)
% rlocus(FTLApd)
% %Ganancia kd1
% kd1=kd*1.5
% num=[kp kd1];
% den=[1];
% GcPD1=tf(num,den)
% FTLCpd1 = feedback(GcPD1*Gp, H);
% %Ganancia kd2
% kd2=kd*5
% num=[kp kd2];
% den=[1];
% GcPD2=tf(num,den)
% FTLCpd2 = feedback(GcPD2*Gp, H);
% %Ganancia kd3
% kd3=kd*10
% num=[kp kd3];
% den=[1];
% GcPD3=tf(num,den)
% FTLCpd3 = feedback(GcPD3*Gp, H);
% figure(2)
% step(FTLCpd1, '-b',FTLCpd2, '-g',FTLCpd3, '-r')
% legend('kd*1.5', 'kd*5', 'kd*10');


% %Funcion transferencia controlador proporcional Integral
% kp=30;
% ki=70;
% kd=10;
% num=[kp ki];
% den=[1 0];
% GcPI=tf(num,den)
% %Funcion transferencia lazo abierto y cerrado
% FTLCpi=feedback(Gp*GcPI,H)
% FTLApi=Gp*GcPI
% %Lugar geometrico de las raices
% figure(1)
% rlocus(FTLApi)
% %Ganancia ki1
% ki1=ki*1.5
% num=[kp ki1];
% den=[1 0];
% GcPI1=tf(num,den)
% FTLCpi1 = feedback(GcPI1*Gp, H);
% %Ganancia ki2
% ki2=ki*5
% num=[kp ki2];
% den=[1 0];
% GcPI2=tf(num,den)
% FTLCpi2 = feedback(GcPI2*Gp, H);
% %Ganancia ki3
% ki3=ki*10
% num=[kp ki3];
% den=[1 0];
% GcPI3=tf(num,den)
% FTLCpi3 = feedback(GcPI3*Gp, H);
% figure(2)
% step(FTLCpi1, '-b',FTLCpi2, '-g',FTLCpi3, '-r')
% legend('ki*1.5', 'ki*5', 'ki*10');

% %Funcion transferencia controlador proporcional Derivativo Integral
% kp=30;
% ki=70;
% kd=10;
% num=[kd kp ki];
% den=[1 0];
% GcPDI=tf(num,den)
% %Funcion transferencia lazo abierto y cerrado
% FTLApdi=Gp*GcPDI
% figure(1)
% rlocus(FTLApdi)
