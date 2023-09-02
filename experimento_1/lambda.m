function I_nova = lambda(I_sn, T, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V, R_s, R_p, lamb)
erro = 1; %Erro da função
I_nova = 1; %Valor de corrente assumido
Tol = 1*10^-7; %Tolerancia do resultado
I_s = (I_sn*(T/T_n)^3)*exp((q*V_go/(A*k)) * ((1/T_n) - (1/T))); %Corrente de saturação
I_pv = (G/G_n)*(I_scn + K_i*(T-T_n)); %Corrente da célula
V_t = k*T/q ;  %Tensão térmica

while abs(erro)>Tol 
    I_antigo = I_nova; %Salva o valor de corrente
    I_nova = I_pv -(I_s.*(exp((V+R_s.*I_antigo)./(V_t*A))-1)) - ((V+R_s.*I_antigo)./R_p); %Calcula o novo valor de corrente
    I_nova = lamb*I_nova + (1-lamb)*I_antigo;
    erro = I_nova - I_antigo; %Calcula o erro
end
