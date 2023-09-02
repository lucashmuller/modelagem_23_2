clc

l = 0.2; % Variação sub_relaxamento
I_t0 = zeros(size(V));
I_t25 = zeros(size(V));
I_t60 = zeros(size(V));
I_g200 = zeros(size(V));
I_g500 = zeros(size(V));
I_g1k = zeros(size(V));

for j=1:length(V)
    I_t0(j) = sub_relaxamento(I_sn, T_0, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(j), R_s, R_p, l);
    I_t25(j) = sub_relaxamento(I_sn, T_25, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(j), R_s, R_p, l);
    I_t60(j) = sub_relaxamento(I_sn, T_60, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(j), R_s, R_p, l);
    I_g200(j) = sub_relaxamento(I_sn, T_n, T_n, q, V_go, A, k, G_200, G_n, I_scn, K_i, V(j), R_s, R_p, l);
    I_g500(j) = sub_relaxamento(I_sn, T_n, T_n, q, V_go, A, k, G_500, G_n, I_scn, K_i, V(j), R_s, R_p, l);
    I_g1k(j) = sub_relaxamento(I_sn, T_n, T_n, q, V_go, A, k, G_1k, G_n, I_scn, K_i, V(j), R_s, R_p, l);
end
