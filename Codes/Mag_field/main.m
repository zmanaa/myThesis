clc; clear all;

%%
height = 0;  % Earth's Surface
lat = linspace(-90,90,60);
lon = linspace(-180,180,60);

%%
% Bx = zeros(size(lon,2),size(lat,2));
By = zeros(size(lon,2),size(lat,2));
Bz = zeros(size(lon,2),size(lat,2));
total = zeros(size(lon,2),size(lat,2));

for i = 1:size(lon,2)
    for j = 1:size(lat,2)
        [Bx(i,j), By(i,j), Bz(i,j), total(i,j)] =...
        magneticFieldModel(lat(j), lon(i), height);
    end
end

fig =  figure('units','normalized','outerposition',[0 0 1 1]);
set(fig,'color','w');
worldmap('world')   % initializes map
load coastlines
plt = plotm(coastlat,coastlon,'Color','k','LineWidth',2);
plt.Color(4) = 0.25;
hold on;
[c,cont] = contourm( lat, lon, total, "LineWidth", 1.5);
clabelm(c,cont)
title("World Magnetic Field Countour - 2020 -- nT",...
'FontSize', 16 ,'FontWeight','bold' ,Interpreter="latex")
