function [g_x,g_y,g_z, g_tot] = calc_gravity(x, y, z)


R = 6378.14; % km
mu = 3.986004418e+05; % km^3/s^2

% Reading coefficient matricies
c_nm    = [
            1,0.,0.,0.,0.;
            0,0,0,0,0;
            -1082.637e-6,  0.,  1.54e-6,  0.,   0.;
             2.54e-6,  2.16e-6, 0.27e-6, 0.68e-7, 0.;
             1.62e-6, -0.49e-6, 0.77e-7, 0.62e-7, -0.22e-8] ;
s_nm    = [0.,  0.,  0.,  0.,  0.;
           0.,  0.,  0.,  0.,  0.;
           0.,  0., -0.88e-6,  0.,   0.;
           0.,  0.24e-5, 0.26e-6, 0.21e-6, 0.;
           0., -0.46e-6, 0.15e-6,-0.71e-8, 0.75e-8];


v = calculate_v(x, y, z);

[partial_v_x, partial_v_y, partial_v_z] = calc_partial_v(v);


partial_U_x = 0;
partial_U_y = 0;
partial_U_z = 0;

for n = 2:5
   for m = 1:n
       partial_U_x = partial_U_x + ((R^(n)) *(c_nm(n,m) - s_nm(n,m)*1i) * partial_v_x(n,m));
       partial_U_y = partial_U_y + ((R^(n)) *(c_nm(n,m) - s_nm(n,m)*1i) * partial_v_y(n,m));    
       partial_U_z = partial_U_z + ((R^(n)) *(c_nm(n,m) - s_nm(n,m)*1i) * partial_v_z(n,m));
   end
end 


partial_U_x = real(partial_U_x);
partial_U_y = real(partial_U_y);
partial_U_z = real(partial_U_z);

g = [partial_U_x; partial_U_y; partial_U_z]*mu; 

g_x = g(1);
g_y = g(2);
g_z = g(3);

g_tot = sqrt(g_x^2 + g_y^2 + g_z^2);

end