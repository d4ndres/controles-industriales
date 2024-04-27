%% Maestría en Controles Industriales
% Entregable 4
% Autor: Diego Andrés Rojas González
% Docente: Dr. Oscar J. Suarez
% Matemática Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en Matlab
% modeloVanDerPol(~,y,mu) -> dy : Array[2][1]

function dy = modeloVanDerPol(~, y, mu)
    dy = [  y(2)
            mu*(1-y(1)^2)*y(2)-y(1)];
end
%% Ejercicio 4c - Oscilador de van der pol - Sistema no lineal
%Grafica que me muestra el comportamiento de dos estados en un sistema no
%lineal: Retrato fase
