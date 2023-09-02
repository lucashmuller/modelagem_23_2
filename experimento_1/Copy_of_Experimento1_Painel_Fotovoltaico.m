clc
%% ---------------Conversor Buck-----------------%
R = 1; %Resistência de carga
L = 1*10^-3; %Indutância
C = 800*10^-6; %Capacitância
f_s = 2*10^3; %Frequência de chaveamento PWM
%------------------------------------------------%

%% -------------Célula fotovoltaica--------------%
R_p = 38.17; %Resistência paralela
R_s = 61.3*10^-3; %Resistência em série
A = 1.7538; %Fator de idealidade do diodo
I_sn = 5.68*10^-6; %Corrente de saturação nominal do diodo
q = 1.602*10^-19; %Carga do elétron
k = 1.38*10^-23; %Constante de Boltzmann
V_go = 1.1*q; %Tensão de band gap
% I_scn = 3.1656; %Corrente de curto circuito
I_scn = 8.31;
G_n = 1*10^3; %Irradiação solar nominal
T_n = 298.15;% C° Temperatura nominal da célula fotovoltaica
K_i = 1.8*10^-3; %Coeficiente de temperatura da corrente
%------------------------------------------------%

%% -----------------Suposições-------------------%
T = 273.13; %Temperatura

%Questão 1-a)
G = G_n; %Irradiação
T_0 = 273.15;  %0°C
T_25 = 298.15; %25°C
T_60 = 333.15; %60°C

%Questão 1-b)
G_200 = 200; %[W/m²] 
G_500 = 500; %[W/m²] 
G_1k = 1000; %[kW/m²]

%------------------------------------------------%

%% ----------------Equacionamento----------------%
I_s = (I_sn*(T/T_n)^3)*exp((q*V_go/(A*k)) * ((1/T_n) - (1/T))); %Corrente de saturação
V_t = k*T/q ;  %Tensão térmica
V = 0:0.01:0.7; %Tensão de uma célula
I_pv = (G/G_n)*(I_scn + K_i*(T-T_n)); %Corrente da célula

%% -------------------Algoritmo------------------%
l = 0.155; %variação lambda
I_t0 = lambda(I_sn, T_0, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V, R_s, R_p, l);
I_t25 = lambda(I_sn, T_25, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V, R_s, R_p, l);
I_t60 = lambda(I_sn, T_60, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V, R_s, R_p, l);

It_0 = zeros(size(V));
It_25 = zeros(size(V));
It_60 = zeros(size(V));
Ig_200 = zeros(size(V));
Ig_500 = zeros(size(V));
Ig_1k = zeros(size(V));
for i=1:length(V)
    It_0(i) = fzero(@(I) funTest(I_sn, T_0, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    It_25(i) = fzero(@(I) funTest(I_sn, T_25, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    It_60(i) = fzero(@(I) funTest(I_sn, T_60, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    Ig_200(i) = fzero(@(I) funTest(I_sn, T_n, T_n, q, V_go, A, k, G_200, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    Ig_500(i) = fzero(@(I) funTest(I_sn, T_n, T_n, q, V_go, A, k, G_500, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    Ig_1k(i) = fzero(@(I) funTest(I_sn, T_n, T_n, q, V_go, A, k, G_1k, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
end


%plots questão 1a
subplot(1,2,1);
title('Curva I x V');
xlabel("Tensão da célula [V]");
ylabel("Corrente da célula [A]");
hold on;
plot(V,It_0);
plot(V,It_25);
plot(V,It_60);
plot(V,I_t0,'-.');
plot(V,I_t25,'-.');
plot(V,I_t60,'-.');
legend('T = 0°C', 'T = 25°C','T = 60°C');
% axis([0 0.8 0 3.5]);
axis([0 0.8 0 9]);

subplot(1,2,2);
title('Curva P x V');
xlabel("Tensão da célula [V]");
ylabel("Potência gerada [W]");
hold on
plot(V,V.*It_0);
plot(V,V.*It_25);
plot(V,V.*It_60);
plot(V,V.*I_t0,'-.');
plot(V,V.*I_t25,'-.');
plot(V,V.*36.*I_t60,'-.');
legend('T = 0°C', 'T = 25°C','T = 60°C');
% ylim([0 1.2]);
ylim([0 2]);
hold off

% plots questão 1b
figure
I_g200 = lambda(I_sn, T_n, T_n, q, V_go, A, k, G_200, G_n, I_scn, K_i, V, R_s, R_p, l);
I_g500 = lambda(I_sn, T_n, T_n, q, V_go, A, k, G_500, G_n, I_scn, K_i, V, R_s, R_p, l);
I_g1k = lambda(I_sn, T_n, T_n, q, V_go, A, k, G_1k, G_n, I_scn, K_i, V, R_s, R_p, l);


subplot(1,2,1);
title('Curva I x V');
xlabel("Tensão da célula [V]");
ylabel("Corrente da célula [A]");
hold on
plot(V,Ig_200);
plot(V,Ig_500);
plot(V,Ig_1k);

plot(V,I_g200,'-.');
plot(V,I_g500,'-.');
plot(V,I_g1k,'-.');
legend('G = 200', 'G = 500','G = 1000');
% axis([0 0.8 0 3.5]);
axis([0 0.8 0 9]);

subplot(1,2,2);
title('Curva P x V');
xlabel("Tensão da célula [V]");
ylabel("Potência gerada [W]");
hold on
plot(V,V.*Ig_200);
plot(V,V.*Ig_500);
plot(V,V.*Ig_1k);

plot(V,V.*I_g200,'-.');
plot(V,V.*I_g500,'-.');
plot(V,V.*I_g1k,'-.');
legend('G = 200', 'G = 500','G = 1000');
% ylim([0 1.2]);
ylim([0 1.5]);
hold off

%Adicionar Legendas e unidades

%bateria escolhida Bateria Solar de Lítio 250Wh - Unipower UPLFP24-10 4000
%ciclos 25.6V