function r = calc_sun_pos_vector(T0, prompt)
%CALC_SUN_POS_VECTOR Gets the sun position vector
%
% INPUTS: 
%   T0      - Julian centuries.
%   prompt  - Km or AU
% 
% OUTPUTS:
%   r       - Sun position vector



lamda_m_0 = 280.460 + 36000 * T0;
M_0 = 357.291092 + 35000.05034 * T0;
lamda_ecl = lamda_m_0 + 1.914666471 * sind(M_0) + 0.019994643 *
sind(2*M_0);
r_0 = 1.000140612 - 0.016708617 * cosd(M_0) - 0.000139589 *
cosd(2*M_0);
epsilon = 23.439291 - 0.0130042 * T0;
if strcmpi(prompt,"AU")
r_x = r_0 *cosd(lamda_ecl);
r_y = r_0 *cosd(epsilon)*sind(lamda_ecl);
r_z = r_0 *sind(epsilon)*sind(lamda_ecl);
elseif strcmpi(prompt,"Km")
r_x = r_0 *cosd(lamda_ecl)*1.496e+8;
r_y = r_0 *cosd(epsilon)*sind(lamda_ecl)*1.496e+8;
r_z = r_0 *sind(epsilon)*sind(lamda_ecl)*1.496e+8;
else
throw("Error, Check units!");
end

r = [r_x, r_y, r_z];
end