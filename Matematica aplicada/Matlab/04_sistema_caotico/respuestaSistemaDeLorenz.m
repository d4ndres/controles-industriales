%% Maestría en Controles Industriales
% Entregable 4
% Autor: Diego Andrés Rojas González
% Docente: Dr. Oscar J. Suarez
% Matemática Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en Matlab
% Modelo de Lorenz. Respuesta al sistema y diagrama fase.

%% Limpiamos variables y cerramos ventanas
clc
clear all
close all

%% Resolvemos el sistema de ecuaciones 
% El sistema de ecuaciones está definido en la función "modeloDeLorenz"
tf = 100;
[t, y] = ode45(@modeloDeLorenz, [0 400], [-10 30 20]);
%% Graficamos la respuesta del sistema y el diagrama fase

figure('pos', [ 200, 50, 1000, 600]);

%Respuesta del sistema
subplot(1,2,1)
plot(t,y)
xlabel('t')
ylabel('y(t)')
title('Respuesta del sistema Lorenz', 'FontSize', 20)
grid on

%Diagrama fase haciendo uso de plot3
subplot(1,2,2)
plot3(y(:,1), y(:,2), y(:,3))
xlabel('y1')
ylabel('y2')
zlabel('y3')
title('Retrato fase', 'FontSize', 20)
grid on

%% comparación de condiciones iniciales

% Resolvemos el sistema para otras condiciones iniciales
[t2, y2] = ode45(@modeloDeLorenz, [0 400], [-10 35 20]);

% Comparamos diagrama de fase
figure('pos', [ 200, 50, 1000, 600]);
plot3(y(:,1), y(:,2), y(:,3))
xlabel('y1')
ylabel('y2')
zlabel('y3')
title('Retrato fase cambio en condiciones iniciales', 'FontSize', 20)
grid on
hold on
plot3(y2(:,1), y2(:,2), y2(:,3), '-r')
legend('CI [-10 30 20]', 'CI [-10 35 20]')
