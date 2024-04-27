%% Maestría en Controles Industriales
% Entregable 4
% Autor: Diego Andrés Rojas González
% Docente: Dr. Oscar J. Suarez
% Matemática Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en Matlab
% Respuesta y retrato face del modelo de Van Der Pol

%% Limpiamos variables y cerrar todo
clc
clear all

%% Resolvemos el sistema de ecuaciones de Van Der Pol
% El sistema de ecuaciones está definido en la función "modeloVanDerPol"
mu = 10;
f = @(t,y) modeloVanDerPol(t,y,mu);
tf = 100; % tiempo de simulación final
y0 = [0 1]; % Condiciones iniciales
[t, y] = ode45(f, [0 tf], y0);

figure('pos', [ 200, 50, 1000, 600]);

% Gráfica de la respuesta
subplot(1, 2, 1);
plot(t,y)
title(['Van Der Pol Mu = ', num2str(mu)]);
xlabel('t')
ylabel('y(t)')
grid on

% Gráfica del retrato de fase
subplot(1, 2, 2)
plot(y(:,1), y(:,2))
title(['Retrato fase Mu = ', num2str(mu)]);
xlabel('y1')
ylabel('y2')
grid on










