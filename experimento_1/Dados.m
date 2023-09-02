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
V_go = 1.1; %Tensão de band gap
% I_scn = 3.1656; %Corrente de curto circuito
I_scn = 3.1656;
G_n = 1*10^3; %Irradiação solar nominal
T_n = 298.15;% C° Temperatura nominal da célula fotovoltaica
K_i = 1.8*10^-3; %Coeficiente de temperatura da corrente

%------------------------------------------------%
%% -----------------Suposições-------------------%

T = 273.13; %Temperatura

% Questão 1-a)
G = G_n; %Irradiação
T_0 = 273.15;  %0°C
T_25 = 298.15; %25°C
T_60 = 333.15; %60°C

% Questão 1-b)
G_200 = 200; %[W/m²] 
G_500 = 500; %[W/m²] 
G_1k = 1000; %[kW/m²]

%------------------------------------------------%
%% ----------------Equacionamento----------------%

I_s = (I_sn*(T/T_n)^3)*exp((q*V_go/(A*k)) * ((1/T_n) - (1/T))); %Corrente de saturação
V_t = k*T/q ;  % Tensão térmica
V = 0:0.01:0.7; % Tensão de uma célula
I_pv = (G/G_n)*(I_scn + K_i*(T-T_n)); % Corrente da célula
