%% plots questão 1a
% subplot(1,2,1);
% title('Curva I x V');
% xlabel("Tensão da célula [V]");
% ylabel("Corrente da célula [A]");
% hold on;
% plot(V,It_0);
% plot(V,It_25);
% plot(V,It_60);
% plot(V,I_t0,'-.');
% plot(V,I_t25,'-.');
% plot(V,I_t60,'-.');
% legend('T = 0°C', 'T = 25°C','T = 60°C');
% axis([0 0.8 0 3.5]);
% hold off
% subplot(1,2,2);
% title('Curva P x V');
% xlabel("Tensão da célula [V]");
% ylabel("Potência gerada [W]");
% hold on
% plot(V,V.*It_0);
% plot(V,V.*It_25);
% plot(V,V.*It_60);
% plot(V,V.*I_t0,'-.');
% plot(V,V.*I_t25,'-.');
% plot(V,V.*I_t60,'-.');
% legend('T = 0°C', 'T = 25°C','T = 60°C');
% ylim([0 1.2]);
% hold off
% 
% %% plots questão 1b
% figure
% subplot(1,2,1);
% title('Curva I x V');
% xlabel("Tensão da célula [V]");
% ylabel("Corrente da célula [A]");
% hold on
% plot(V,Ig_200);
% plot(V,Ig_500);
% plot(V,Ig_1k);
% plot(V,I_g200,'-.');
% plot(V,I_g500,'-.');
% plot(V,I_g1k,'-.');
% legend('G = 200', 'G = 500','G = 1000');
% axis([0 0.8 0 3.5]);
% hold off
% subplot(1,2,2);
% title('Curva P x V');
% xlabel("Tensão da célula [V]");
% ylabel("Potência gerada [W]");
% hold on
% plot(V,V.*Ig_200);
% plot(V,V.*Ig_500);
% plot(V,V.*Ig_1k);
% plot(V,V.*I_g200,'-.');
% plot(V,V.*I_g500,'-.');
% plot(V,V.*I_g1k,'-.');
% legend('G = 200', 'G = 500','G = 1000');
% ylim([0 1.2]);
% hold off
% 
% %% plots Potência máxima
% figure
% Ip_max = Ip_max.*3;
% I_pmax = I_pmax.*3;
% Vnew = V.*108./3;
% subplot(1,2,1);
% title('Curva I x V');
% xlabel("Tensão da célula [V]");
% ylabel("Corrente da célula [A]");
% hold on
% plot(Vnew,Ip_max);
% plot(Vnew,I_pmax,'-.');
% legend('T=0 G=100');
% axis([0 25 0 13]);
% hold off
% subplot(1,2,2);
% title('Curva P x V');
% xlabel("Tensão da célula [V]");
% ylabel("Potência gerada [W]");
% hold on
% plot(Vnew,Vnew.*Ip_max);
% plot(Vnew,Vnew.*I_pmax,'-.');
% legend('T=0 G=100');
% ylim([0 120]);
% hold off
%% gráficos igual o do professor
figure
set(gcf,'OuterPosition',[0 figHeight+5 figWidth figHeight-10]);
set(gcf,'name', 'Comportamento da célula conforme temperatura')
hold on;
grid on
plot(V,It_0);
plot(V,It_25);
plot(V,It_60);
plot(V,I_t0,'k:');
plot(V,I_t25,'k:');
plot(V,I_t60,'k:');
title("Comportamento com variações de T")
lgd = legend('T = 0°C', 'T = 25°C','T = 60°C');
lgd.Title.String = "Temperatura";
xlabel("Tensão da célula [V]");
ylabel("Corrente da célula [A]");
ylim([0 3.5]);
xlim([0 0.7]);

figure
set(gcf,'OuterPosition',[0 25 figWidth figHeight-20]);
set(gcf,'name', 'Comportamento da célula conforme irradiação')
title("Comportamento com variações de G")
hold on;
grid on
plot(V,Ig_200);
plot(V,Ig_500);
plot(V,Ig_1k);
plot(V,I_g200,'k:');
plot(V,I_g500,'k:');
plot(V,I_g1k,'k:');
lgd = legend('G = 200', 'G = 500','G = 1000');
lgd.Title.String = "Irradiação";
xlabel("Tensão da célula [V]");
ylabel("Corrente da célula [A]");
ylim([0 3.5]);
xlim([0 0.7]);

figure
set(gcf,'OuterPosition',[figWidth figHeight+5 figWidth figHeight-10]);
set(gcf,'name', 'potência')
hold on
grid on
plot(V,V.*It_0);
plot(V,V.*It_25);
plot(V,V.*It_60);
plot(V,V.*I_t0,'k:');
plot(V,V.*I_t25,'k:');
plot(V,V.*I_t60,'k:');
title('Curva P x V com variações de T');
xlabel("Tensão da célula [V]");
ylabel("Potência gerada [W]");
lgd = legend('T = 0°C', 'T = 25°C','T = 60°C');
lgd.Title.String = "Temperatura";
ylim([0 1.2]);
xlim([0 0.7]);

figure
set(gcf,'OuterPosition',[figWidth 25 figWidth figHeight-20]);
set(gcf,'name', 'potência')
hold on
grid on
plot(V,V.*Ig_200);
plot(V,V.*Ig_500);
plot(V,V.*Ig_1k);
plot(V,V.*I_g200,'k:');
plot(V,V.*I_g500,'k:');
plot(V,V.*I_g1k,'k:');
title('Curva P x V com variação de G');
xlabel("Tensão da célula [V]");
ylabel("Potência gerada [W]");
lgd = legend('G = 200', 'G = 500','G = 1000');
lgd.Title.String = "Irradiação";
ylim([0 1.2]);
xlim([0 0.7]);

figure
Ip_max = Ip_max.*3;
I_pmax = I_pmax.*3;
Vnew = V.*108./3;
xlabel("Tensão da célula [V]");
ylabel("Corrente da célula [A]");
hold on
plot(Vnew,Ip_max);
plot(Vnew,I_pmax,'k:');
axis([0 25 0 10]);
hold off
yyaxis right
title('Máxima potência com arranjo 3 x 36 células');
ylabel("Potência gerada [W]");
hold on
plot(Vnew,Vnew.*Ip_max);
plot(Vnew,Vnew.*I_pmax,'k:');
legend('T=0 & G=1000');
ylim([0 120]);
hold off
