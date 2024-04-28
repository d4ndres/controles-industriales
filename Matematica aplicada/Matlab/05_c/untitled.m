%ingenieri de control moderna OGATA
%Estos se puede modelar en esapcio de estados
%funcion de transferencia -> siso -> de 2 orden

%Estos son los que en la vida real se trabajan
%mimo
%miso
%simo

%% ecuaciones diferenciales a sistema de ecuacione // matriz cuadrata para sistema de ecuaciones tantas como ED

% polo >= ceros ? funcion propia : funcion impropia
% simulink funcion impropia da un error sintaxt error
% ceor fase minima o no minima
% estabilidad

%Estable
num = [0 5]; % salen ceros
den = [1 1]; % Salen polos 

sys = tf(num,den);


figure(1);
impulse(sys);
grid on;
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda impulso');

%%
figure(2)
step(sys)
grid on
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda escalon');
%%
t = 0:0.01:5;
x=t;
figure(3);
lsim(t,x,sys);
grid on % colocar cuadrilla a la grafica
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda rampa');

%% Inestable
num = [1 0 1]; % salen ceros
den = [1 4 0 10]; % Salen polos 
% sistema inestable
sys = tf(num,den);

figure(1);
impulse(sys);
grid on;
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda impulso');

%%
figure(2)
step(sys)
grid on
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda escalon');
%%
t = 0:0.05:600;
x=t;
figure(3);
lsim(t,x,sys);
grid on % colocar cuadrilla a la grafica
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda rampa');

%% Marginalmente estable 
num = [1 -8]; % salen ceros
den = [1 2 4 0]; % Salen polos

% como esta a la derecha fase no minima
% ganancia en lazo abierto tiende a negativo 
% por lo que las s ahora son cero y quedaria algo como -8/0 entonces es
% indeterminado

% sistema inestable
sys = tf(num,den);

figure(1);
impulse(sys);
grid on;
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda impulso');

%%
figure(2)
step(sys)
grid on
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda escalon');
%%
t = 0:0.05:600;
x=t;
figure(3);
lsim(t,x,sys);
grid on % colocar cuadrilla a la grafica
xlabel('Tiempo');
ylabel('Altura del tanque (h(t))');
title('Respuesta de entreda rampa');

%% 
% hay una tecnica de control llamada diseño de control con polos y ceros
% los polos se entienden como atractores
% el sistema tiende al polo, marcan estabilidad, ( analogia con un SLNL hay punto de equilibrio estable, atractor)

rlocus(sys)
grid on

%% para obtener la transformada de laplace de una funcion utiliando calulo simbolicao
syms t positive;
f = t^2;
F = laplace(f);

% para obtener de foma simbolica la transformada inversa de la place de una
% funcion
syms s
Y = 1 / (s+1);
y = ilaplace(Y);

%para representar funciones simbolicas
syms t ;
ezplot(t^2+4, [-1,1]);

%% Para hacer la expresion mas legible, podemos usar los comandos simplify y pretty.

syms t s
f = -1.25+3.5*t*exp(-2*t) + 1.25*exp(-2*t);
F = laplace(f,t,s);
simpleF = simplify(F);
pretty(simpleF);


%% De la plas al tiempo 
syms t s;
F = (s - 5) / (s*(s+2)^2);
f = ilaplace(F);
simpleF = simplify(f);
pretty(simpleF);

%% Esto no se entrega, esto es algo llamado complejo conjugado. raices repetidas y r... 
% cuando los ceros estan en el eje imaginario se define como "no es de face
% minima"
% entre mas lejos esten los polos de del eje natural mas grande es el
% aoveshoot

num = [1 0 5];
den = [1 2 3 1];
sys = tf (num,den);
rlocus(sys);
roots(den);
step(sys);

%% r residuo, k gananacia
num = [4 4 4];
den = [1 3 2 0 0];
[r,p,k] = residue(num,den);
sys = tf(num,den);
step(sys);
r

%%


num = [0.95 0 2];
den = [0.817 2.128 5.045 4.48 3];
sys = tf (num,den);
rlocus(sys);
roots(den);
grid on

%% espacio de estados
num = [0.95 0 2];
den = [0.817 2.128 5.045 4.48 3];
[A,B,C,D] = tf2ss(num,den);
sys = tf(num,den);
%% a la hora de trabajar con espacio de estados conocer muy bien el sistema para definir sus condiciones iniciales


