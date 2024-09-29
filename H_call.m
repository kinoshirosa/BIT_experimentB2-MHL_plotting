function [H] = H_call(U_H, N_1)
%H_CALL 此处显示有关此函数的摘要
%   此处显示详细说明
L = 0.075; R_1 = 5;
H = (N_1*U_H)/(L*R_1);
end

