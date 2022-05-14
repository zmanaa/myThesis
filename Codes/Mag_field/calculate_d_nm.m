function [d_nm] = calculate_d_nm
%calculate_d_nm: Create a matrix storing d_nm values
%
% OUTPUT:
%   dnm - 14-by-14 matrix storing the values of d_nm.
%   
% ----------------------------------------------------

d_nm = zeros(14,14);
for n = 2:14
   for m = 1:n    
       if m == 1 
           d_nm(n,m) = 1; 
       elseif m == 2 && n == 2
           d_nm(n,m) = 1;
       elseif n == 2 && m == 1
           d_nm(n,m) = 1;
       elseif m==n && m~=2 && n~=2
           d_nm(n,n) = d_nm(n-1,n-1)*1/sqrt((2*(n-1)-1)*2*(n-1));
       elseif n ~= m 
           num = factorial(n-m);
           den = factorial(n+m-2);
           d_nm(n,m) = sqrt(2)*sqrt(num/den);
       end
   end
end
end