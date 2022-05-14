function v = calculate_v(x, y, z)
%calculate_v: calculate v; the potential function.
% INPUTS:
%
%   x   - x coordinate of the point of intrest
%   y   - y coordinate of the point of intrest
%   z   - z coordinate of the point of intrest
%
% OUTPUT:
%   v - 7-by-7 matrix storing the values of v.
%   
% ----------------------------------------------------

v = zeros(6,6);

r = sqrt(x^2 + y^2 + z^2);

v(1,1) = 1/r;
n_max = 6;

for n = 2:n_max
    v(n,n) = (2*(n-1) - 1) * ((x+(y*1i))/r^2)*v(n-1,n-1);
   for m = 1:n                
        if n-m == 1    
            v(n,m) = (2*(n-1) -1) * z * v(n-1, m)/(r^2 * (n - m));
        elseif n-m > 1
            v(n,m) = ((2*(n-1) -1) * z * v(n-1, m) / ((n-m)*r^2)) -...
                (((n + m -3)*v(n-2,m))/((n-m)*r^2));
        end
   end
end 
end