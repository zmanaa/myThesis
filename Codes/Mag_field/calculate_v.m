function v = calculate_v(x, y, z)
% calculate_v: calculate v; the potential function.
% INPUTS:
%
%   x   - x coordinate of the point of interest
%   y   - y coordinate of the point of interest
%   z   - z coordinate of the point of interest
%
% OUTPUT:
%   v - 14-by-14 matrix storing the values of v.
%   
% ----------------------------------------------------

v = zeros(15,15);
r = sqrt(x^2 + y^2 + z^2);
v(1,1) = 1/r;
for n = 2:14
   for m = 1:n    
        if m == n
            v(n,m) = (2*(n-1) - 1) * ((x+y*1i)/r^2)*v(n-1,n-1);
        elseif n-m == 1    
            v(n,m) = (2*(n-1) -1) * z * v(n-1, m)/(r^2 * (n - m));
        elseif n-m > 1
            v(n,m) = ((2*(n-1) -1) * z * v(n-1, m) / ((n-m)*r^2)) -...
                (((n + m -3)*v(n-2,m))/((n-m)*r^2));
            if n == 13
                    a = 3;
            end
        end
   end
end 
end