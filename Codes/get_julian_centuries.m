function [T0] = get_julian_centuries(JD)
%GET_JULIAN_CENTURIES: calculates julian centuries
T0 = (JD-2451545)/(36525);
end