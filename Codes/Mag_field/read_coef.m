function [g_nm, h_nm, g_nm_dot, h_nm_dot] = read_coef
%read_coef: reads g_nm, h_nm, g_nm_dot, and h_nm_dot
% ---------------------------------------------------- 

% DEFFS
FILENAME_G_NM       = "coefs/g_nm.xlsx";
FILENAME_H_NM       = "coefs/h_nm.xlsx";
FILENAME_G_NM_DOT   = "coefs/g_nm_dot.xlsx";
FILENAME_H_NM_DOT   = "coefs/h_nm_dot.xlsx";

% Reading coefficient matricies
g_nm        = readmatrix(FILENAME_G_NM);
h_nm        = readmatrix(FILENAME_H_NM);
g_nm_dot    = readmatrix(FILENAME_G_NM_DOT);
h_nm_dot    = readmatrix(FILENAME_H_NM_DOT);

end