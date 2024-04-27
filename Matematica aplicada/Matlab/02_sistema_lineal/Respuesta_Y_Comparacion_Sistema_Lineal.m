%% Maestría en Controles Industriales
% Entregable 4
% Autor: Diego Andrés Rojas González
% Docente: Dr. Oscar J. Suarez
% Matemática Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en Matlab
% Modelo sistema lineal de primer orden

%% Limpiamos variables
clc
clear all


%% Resolvemos el sistema de ecuaciones con ode45, ode23, y ode113
f = @(t,y) - y +2*t;

% tiempo final
tf = 2; 
% condición inicial
y0 = 1;

[t,y] = ode45(f,[0 tf], y0);
[t2,y2] = ode23(f,[0 tf], y0);
[t3,y3] = ode113(f,[0 tf], y0);

%% Graficamos 
figure('pos', [ 200, 50, 1000, 600]);
plot(t,y,'-r');
hold on
plot(t2,y2, '-b');
plot(t3,y3, '-k');
title("Respuesta de diferentes ODE en el sistema lineal", "FontSize", 24);
xlabel('t', "FontSize", 24);
ylabel('y(t)', "FontSize", 24);
legend('ode45', 'ode23', 'ode113')
grid on

