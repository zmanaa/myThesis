function lst = Local_sideral_time(y, m, d, ut, EL)
    
j0 = Julian_day(y, m, d);
j = (j0 - 2451545)/36525;
g0 = 100.4606184 + 36000.77004*j + 0.000387933*j^2 - 2.583e-8*j^3;
g0 = zeroTo360(g0);
gst = g0 + 360.98564724*ut/24;
lst = gst + EL;
lst = lst - 360*fix(lst/360);

function y = zeroTo360(x)
% zeroTo360: reduces an angle to the range 0 - 360 degrees.

    if (x >= 360)
    x = x - fix(x/360)*360;
    elseif (x < 0)
    x = x - (fix(x/360) - 1)*360;
    end
    
    y = x;
end 

end


