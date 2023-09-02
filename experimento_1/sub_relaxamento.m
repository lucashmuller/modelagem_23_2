function I_nova = sub_relaxamento(I_sn, T, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V, R_s, R_p, lamb)
erro = 1; %Erro da função
I_nova = zeros(length(V)); % Valor de corrente assumido
Tol = 1*10^-7; % Tolerancia do resultado
reps = 0;

while (abs(erro)>Tol)
    reps = reps +1;
    I_antigo = I_nova; % Salva o valor de corrente

    I_pv = (G/G_n)*(I_scn + K_i*(T-T_n));
    I_d = ((I_sn*(T/T_n)^3)*exp((q*V_go/(A*k)) * ((1/T_n) - (1/T))).*(exp((V+R_s.*I_antigo)./((k*T/q) *A))-1));
    I_p = ((V+R_s.*I_antigo)./R_p);

    I_nova = I_pv - I_d - I_p ; % Calcula o novo valor de corrente
    I_nova = lamb*I_nova + (1-lamb)*I_antigo;
    erro = I_nova - I_antigo; % Calcula o erro

    if reps > 200
        break
    end
end
