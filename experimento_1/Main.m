clear
close all
clc;

%% Configuração de um grid na tela para gráficos

screenSize = get(0,'screensize'); % gets screen size
monWidth = screenSize(3);
monHeight = screenSize(4);

% establishing a 2x2 grid on the screen
figHeight = monHeight/2;
figWidth = monWidth/2;

%% Inicializando os arquivos
run("Modelagem Exp1\Dados.m");
run("Modelagem Exp1\Resolucao_fzero.m");
run("Modelagem Exp1\Resolucao_subrelaxamento.m");
run("Modelagem Exp1\Graficos.m");
