close all
clear
clc
%% Parameter Setup
% filename = "lizhaoji.pcd";
% filename = "qiyansuo.pcd";
filename = "zhulou.pcd";
num_sector = 60;
num_ring = 20;
max_range = 80;
%% Scan Context Calculation
ptCloud = pcread(filename);
img = Ptcloud2ScanContext(ptCloud, num_sector, num_ring, max_range);
img = img - min(min(img));
x = 2 * pi / num_sector * (1 : num_sector);
y = max_range / num_ring * (1 : num_ring);
[X, Y] = meshgrid(x, y);
%% Scan Context Visualization
figure
set(gcf,'Unit', 'Centimeters', 'Position', [10 5 20 8])
surf(X, Y, img, 'EdgeColor', 'none')
set(gca,'FontName','Times New Roman')
view(2)
grid off
colormap jet
c = colorbar;
c.Label.String = '\fontname{宋体}最大高度\fontname{Times New Roman} / m';
set(gca,'YDir','reverse')
xlim([0 2 * pi])
ylim([0 max_range])
set(gca, 'XTick', [0 : 0.5 * pi : 2 * pi]);
set(gca, 'XTickLabel', {'\fontname{Times New Roman}0','\fontname{Times New Roman}0.5\pi','\fontname{Times New Roman}\pi','\fontname{Times New Roman}1.5\pi','\fontname{Times New Roman}2\pi'})
xlabel('\fontname{宋体}方位角\fontname{Times New Roman} / rad')
ylabel('\fontname{宋体}径向距离\fontname{Times New Roman} / m')