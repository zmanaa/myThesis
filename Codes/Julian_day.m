function J0 = Julian_day(year, month, day)
% Julian_day: computes the Julian day number at 0 UT for any year
% between 1900 and 2100 using Equation 5.48.
% 
% INPUTS:
%   - year  - range: 1901 to 2099
%   - month - range: 1 to 12
%   - day   - range: 1 to 31 
%
% OUTPUTS:
%   - j0    - Julian day at 0 hr UT (Universal Time)


J0 = 367*year - fix(7*(year + fix((month + 9)/12))/4)...
    + fix(275*month/9) + day + 1721013.5;

end