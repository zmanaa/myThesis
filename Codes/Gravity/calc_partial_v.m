function [partial_v_x, partial_v_y, partial_v_z] = calc_partial_v(v)
%calc_partial_v: calculate the partial derivative of v with respect to x,
%y, and z.
%
% INPUTS:
%   v           - 7-by-7 matrix storing the values of v.
%
% OUTPUT:
%   [partial_v_x, partial_v_y, partial_v_z]     - each partial derivative
%   with respect to x, y, and z.
%   
% ---------------------------------------------------- 

partial_v_x = zeros(5,5);
partial_v_y = zeros(5,5);
partial_v_z = zeros(5,5);
n_max = 5;


% x - dimension
for n = 2:n_max
   for m = 1:n
       if n == n_max
           break;
       elseif m == 1
           partial_v_x(n,m) = -0.5 * (v(n+1,2) + conj(v(n+1,2)));
       else
           num = factorial(n-m+2) * v(n+1,m-1);
           den = factorial(n-m);
           term2 = num/den;
           partial_v_x(n,m) = -0.5 * ( v(n+1,m+1) -  term2 );
       end
   end
end 


for n = 2:n_max
   for m = 1:n   
       if n == n_max
           break;
       elseif m == 1
           partial_v_y(n,m) = 0.5i * (v(n+1,2) - conj(v(n+1,2)));
       else
           num = factorial(n-m+2) * v(n+1,m-1);
           den = factorial(n-m);
           term2 = num/den;
           partial_v_y(n,m) = 0.5i * ( v(n+1,m+1) +  term2 );
       end
   end
   
end

for n = 2:n_max
   for m = 1:n  
       if n == 5
           break;
       else
           num = factorial(n-m+1) * v(n+1,m);
           den = factorial(n-m);
           partial_v_z(n,m) = - num/den;
       end
   end
end

    
end


