function [Bx, By, Bz, total] = magneticFieldModel(lat, lon, alt)
%magneticFieldModel: get the magnetic field at specific point in space.
%
% INPUTS:
%   lon             - longitude of the point
%   lat             - latitude of the point
%   alt             - altitude of the point
% OUTPUT:
%   [Bx, By, Bz, total]    - x, y, and z component of the magnetic field.
%   total, is the total magnetic field.
%
% DEFS
R = 6371.2; % meters
% Reading coefficient matricies
[g_nm, h_nm, g_nm_dot, h_nm_dot] = read_coef;
% d_(n,m) matrix
d_nm = calculate_d_nm();
% Transform from longitude and latitude 
C = lla2ecef( [lat lon alt])/1000;
x = C(1);
y = C(2);
z = C(3);

% calculate the potential function
v = calculate_v(x, y, z);
% calculate the derivative of the potential function
[partial_v_x, partial_v_y, partial_v_z] = calc_partial_v(v);
% calc. B
Bx = 0;
By = 0;
Bz = 0;

for n = 2:14
   for m = 1:n
      % Bx
      Bx = Bx + (R^(n-1) * (g_nm(n,m) - (h_nm(n,m)*1i)) ...
      * d_nm(n,m) * partial_v_x(n,m));
      % By
      By = By + (R^(n-1) * (g_nm(n,m) - (h_nm(n,m)*1i)) ...
      * d_nm(n,m) * partial_v_y(n,m));
      % Bz
      Bz = Bz + (R^(n-1) * (g_nm(n,m) - (h_nm(n,m)*1i)) ...
      * d_nm(n,m) * partial_v_z(n,m));
   end
end 
Bx      = - R^2 * real(Bx);
By      = - R^2 * real(By);
Bz      = - R^2 * real(Bz);
total   = sqrt(Bx^2 + By^2 + Bz^2);
end