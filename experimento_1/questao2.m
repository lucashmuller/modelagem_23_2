I_scpainel = 6.71; %Corrente de curto circuito
V_1 = 0:0.01:0.7; %Tensão de uma célula
I_pvpainel = (G/G_n)*(I_scpainel + K_i*(T-T_n)); %Corrente da célula
G_800 = 1200;
T_npainel = 293.13;
T_n = 318.15;% C°a
% 
% l = 0.15; %variação lambda
% I_painel = lambdap(I_sn, T_npainel, T_n, q, V_go, A, k, G_800, G_n, I_scpainel, K_i, V_1, R_s, R_p, l);
% plot(V_1.*36,I_painel)
% axis([0 30 0 7]);
% hold on 
% yyaxis right
% plot(V_1.*36,I_painel.* V_1.*36)
% ylim([0 100]);

for i=1:length(V)
    Ic(i) = fzero(@(I) funTest(I_sn, T, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
end
plot(V,Ic)