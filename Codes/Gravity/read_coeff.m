function [c_nm, s_nm] = read_coeff

% DEFFS
FILENAME_C_NM      = "c_nm.xlsx";
FILENAME_S_NM      = "s_nm.xlsx";


% Reading coefficient matricies
c_nm        = readmatrix(FILENAME_C_NM);
s_nm        = readmatrix(FILENAME_S_NM);

end