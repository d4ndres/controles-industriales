%% Maestría en Controles Industriales
% Entregable 4
% Autor: Diego Andrés Rojas González
% Docente: Dr. Oscar J. Suarez
% Matemática Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en Matlab
% Modelo de regulación celular de P53

%% Limpiamos variables
clc
clear all

%% Resolvemos el sistema de ecuaciones con ode45 
% El sistema de ecuaciones está definido en la función "modeloP53"
[t, x] = ode45(@modeloP53, [0 24 * 4 * 3600], [90 0 0 0 700 0]);

%% Definimos variables convenientes y los estados del modelo matemático

%Las siguientes variables no se utilizan en el código
%Decimation = 60000;
%Ts = 1 * 10 ^ -3;
%Sn = 20;
%Sf = 24;
%Sl = 26;

Ti = 0;
h = 24 * 4;
s = 3600 * h;

% Estados
p53 = x(:, 1); %*
Mdm2_mRNAnuclear = x(:, 2);
Mdm2_mRNAcytoplasmic = x(:, 3);
Mdm2cytoplasmic = x(:, 4);
Mdm2nuclear = x(:, 5); %*
p14ARF = x(:, 6);

% Días definidos por horas
day1 = 24;
day2 = 48;
day3 = 72;
day4 = 96;

% Definición del dominio en segundos
ts = linspace(Ti, s, length(p53));
% Definicion del dominio en Horas
th = linspace(Ti, h, length(p53));

%% Graficamos la respuesta de P53-Mdm2

figure('pos', [ 200, 50, 1000, 600]);
plot(th, p53, '-k', th, Mdm2nuclear, '-r', 'LineWidth', 2);
hold on
grid on
line([day1 day1], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'k');
line([day2 day2], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'b');
line([day3 day3], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'g');
line([day4 day4], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'r');
title('Respuesta de P53-Mdm2nuclear', 'Fontsize', 20);
xlabel('t(horas)', 'Fontsize', 20);
ylabel('Concentración de proteínas', 'Fontsize', 20);
legend('p53','Mdm2nuclear', 'Location', 'northeast');


%% Grafica la respuesta de los estados del sistema

% Define posición y tamaño a la imagen.
%figure('pos', [35 45 800 600]); 

figure('pos', [ 200, 50, 1000, 600]);
plot(th, p53, '-k', th, Mdm2_mRNAnuclear, '-g', th, Mdm2_mRNAcytoplasmic, '-b', th, Mdm2cytoplasmic, '-y', th, Mdm2nuclear, '-r', th, p14ARF, '-c', 'LineWidth', 2);
hold on
grid on
line([day1 day1], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'k');
line([day2 day2], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'b');
line([day3 day3], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'g');
line([day4 day4], [0 2000], 'LineWidth', 0.7, 'LineStyle', '-.', 'color', 'r');
title('Respuesta del sistema biologico', 'Fontsize', 20);
xlabel('t(horas)', 'Fontsize', 20);
ylabel('Concentración de proteinas', 'Fontsize', 20);
legend('p53', 'Mdm2mRNAnuclear', 'Mdm2mRNAcytoplasmic', 'Mdm2cytoplasmic', 'Mdm2nuclear', 'p14ARF', 'Location', 'northeast');
