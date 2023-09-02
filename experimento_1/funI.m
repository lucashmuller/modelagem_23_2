function test = funI(I_sn, T, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V, R_s, R_p, I)
    test = (G/G_n)*(I_scn + K_i*(T-T_n)) - ((I_sn*(T/T_n)^3)*exp((q*V_go/(A*k)) * ((1/T_n) - (1/T))).*(exp((V+R_s.*I)./((k*T/q) *A))-1)) - ((V+R_s.*I)./R_p) - I;
end
