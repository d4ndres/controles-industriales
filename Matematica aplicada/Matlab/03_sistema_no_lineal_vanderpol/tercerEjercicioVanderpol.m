%% Maestría en Controles Industriales
% Entregable 4
% Autor: Diego Andrés Rojas González
% Docente: Dr. Oscar J. Suarez
% Matemática Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en Matlab
% Animación de la respues y retrato face del modelo de Van Der Pol

%% Limpiamos variables y cerrar todo
clc
clear all
close all

%% Desarrollo
tf = 100; % tiempo de simulacion final
y0 = [0 1]; % Condiciones iniciales
mu_values = -0.1:0.005:1; % valores de mu
num_mu = length(mu_values); % número de valores de mu

figure('pos', [ 200, 50, 1000, 600]);

for i = 1:num_mu
    mu = mu_values(i);
    f = @(t,y) modeloVanDerPol(t,y,mu);
    [t, y] = ode45(f, [0 tf], y0);
    
    % Gráfica de y(t)
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
    xlabel('y_1')
    ylabel('y_2')
    grid on

    
    drawnow  % Actualiza la figura
    
    % Pausa para animar
    pause(0.1)
end
