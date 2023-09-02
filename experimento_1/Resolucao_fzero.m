% -------------------Algoritmo------------------%

It_0 = zeros(size(V));
It_25 = zeros(size(V));
It_60 = zeros(size(V));
Ig_200 = zeros(size(V));
Ig_500 = zeros(size(V));
Ig_1k = zeros(size(V));

for i=1:length(V)
    It_0(i) = fzero(@(I) funI(I_sn, T_0, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    It_25(i) = fzero(@(I) funI(I_sn, T_25, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    It_60(i) = fzero(@(I) funI(I_sn, T_60, T_n, q, V_go, A, k, G, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    Ig_200(i) = fzero(@(I) funI(I_sn, T_n, T_n, q, V_go, A, k, G_200, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    Ig_500(i) = fzero(@(I) funI(I_sn, T_n, T_n, q, V_go, A, k, G_500, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);
    Ig_1k(i) = fzero(@(I) funI(I_sn, T_n, T_n, q, V_go, A, k, G_1k, G_n, I_scn, K_i, V(i), R_s, R_p, I),3);    
end
