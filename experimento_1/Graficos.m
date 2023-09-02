%% plots questão 1a
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
axis([0 0.8 0 3.5]);
hold off
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
plot(V,V.*I_t60,'-.');
legend('T = 0°C', 'T = 25°C','T = 60°C');
ylim([0 1.2]);
hold off

%% plots questão 1b

figure
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
axis([0 0.8 0 3.5]);
hold off

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
ylim([0 1.2]);
hold off