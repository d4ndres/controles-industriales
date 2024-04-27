%% Maestr�a en Controles Industriales
% Entregable 4
% Autor: Diego Andr�s Rojas Gonz�lez
% Docente: Dr. Oscar J. Suarez
% Matem�tica Aplicada
% Universidad de Pamplona

%% Ecuaciones diferenciales en Matlab
% modeloDeLorenz(t,y) -> dydt : Array[3][1]

function dydt = modeloDeLorenz(t, y)
    aL = 10;
    bL = 28;
    cL = 8/3;
    dydt = zeros(3,1);
    dydt(1) = aL*(y(2)-y(1));
    dydt(2) = y(1)*(bL-y(3))-y(2);
    dydt(3) = y(1)*y(2)-cL*y(3);
end