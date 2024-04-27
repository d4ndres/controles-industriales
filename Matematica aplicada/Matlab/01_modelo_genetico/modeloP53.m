%% Maestría en Controles Industriales
% Entregable 4
% Autor: Diego Andrés Rojas González
% Docente: Dr. Oscar J. Suarez
% Matemática Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en matlab
% MmodeloP53(t,x) -> dxdt : Array[6][1]
    
function dxdt = modeloP53(t, x) 
    % Declaración de parámetros constantes
    kp = 0.5;
    k1 = 9.963 * 10 ^ -6;
    dp = 1.925 * 10 ^ -5;
    km = 1.5 * 10 ^ -3;
    k2 = 1.5 * 10 ^ -2;
    kd = 740;
    k0 = 8 * 10 ^ -4;
    drc = 1.444 * 10 ^ -4;
    kt = 1.66 * 10 ^ -2;
    ki = 9 * 10 ^ -4;
    dmn = 1.66 * 10 ^ -7;
    k3 = 9.963 * 10 ^ -6;
    ka = 0.5;
    da = 3.209 * 10 ^ -5;
 
    %Ecuaciones diferenciales del modelo
    dxdt = zeros(6, 1);
    dxdt(1) = kp - k1 * x(1) * x(5) - dp * x(1);
    dxdt(2) = km + (k2 * x(1) ^ 1.8 / (kd ^ 1.8 + x(1) ^ 1.8)) - k0 * x(2);
    dxdt(3) = k0 * x(2) - drc * x(3);
    dxdt(4) = kt * x(3) - ki * x(4);
    dxdt(5) = ki * x(4) - dmn * x(5) ^ 2 - k3 * x(5) * x(6);
    dxdt(6) = ka - da * x(6) - k3 * x(5) * x(6);
end
