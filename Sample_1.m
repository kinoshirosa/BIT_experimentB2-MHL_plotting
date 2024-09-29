%% 调整数据
close all; clear; clc
U_H_1 = [-9, -8, -6, -4, -2, 0, 2, 4, 4.6, 6, 8, 9]
U_B_1 = [-730, -720, -700, -650, -600, -500, -400, -120, 0, 280, 600, 730].* power(10, -3);

U_input = [0, 0.5, 0.9, 1.2, 1.5, 1.8, 2.1, 2.4, 2.7, 3.0,3.5];
N_1 = 60;

H_1 = H_call(U_H_1, N_1);
B_1 = B_call(U_B_1);

U_H_2 = [0, 3.2, 4.6, 5.9, 7,9,11,15,18,21.8, 28];
U_B_2 = [0, 180, 350, 500, 600, 730, 800, 950, 1000, 1100, 1300].*10.^(-3);
H_2 = H_call(U_H_2, N_1);
B_2 = B_call(U_B_2);
miu = B_2./H_2; miu(1) = 0;

% plot(U_H_1, U_B_1);
% xlabel('U_H');
% ylabel('U_B');

%% 磁滞回线
figure(1);
title('Magnetic Hysteresis Loop of Material Ⅰ')
grid on;hold on;

set(gca, 'FontWeight', 'bold');

x1_1 = linspace(H_1(1), H_1(4),15);
y1_1 = interp1(H_1, B_1, x1_1, "spline");
plot(x1_1, y1_1,"b.-",'LineWidth',2);
xlabel('H/(A/m)');
ylabel('B/T');
grid on; hold on;
x1_2 = linspace(H_1(4), H_1(8),10);
y1_2 = interp1(H_1, B_1, x1_2, "v5cubic");
plot(x1_2, y1_2,"b.-", 'LineWidth',2);
x1_3 = linspace(H_1(8), H_1(12),15);
y1_3 = interp1(H_1, B_1, x1_3, "spline");
plot(x1_3, y1_3,"b.-", 'LineWidth',2);

set(gca, 'FontWeight', 'bold');
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
x1_1 = linspace(-H_1(1), -H_1(4),15);
y1_1 = interp1(-H_1, -B_1, x1_1, "spline");
plot(x1_1, y1_1,"r.-", 'LineWidth',2);
xlabel('H/(A/m)');
ylabel('B/T');
grid on; hold on;
x1_2 = linspace(-H_1(4), -H_1(8),10);
y1_2 = interp1(-H_1, -B_1, x1_2, "v5cubic");
plot(x1_2, y1_2,"r.-", 'LineWidth',2);

x1_3 = linspace(-H_1(8), -H_1(12),15);
y1_3 = interp1(-H_1, -B_1, x1_3, "spline");
plot(x1_3, y1_3,"r.-", 'LineWidth', 2);

plot(-H_1, -B_1, 'ro', 'MarkerFaceColor', 'y', 'LineWidth',2);
plot(H_1, B_1, 'bo','MarkerFaceColor','y', 'LineWidth',2);

ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%% B-H绘图与u曲线
figure(2);
title("Initial Magnetization Curve of Sample Ⅰ")

yyaxis left;
x2 = linspace(min(H_2), max(H_2), 50);
y2 = interp1(H_2, B_2, x2, 'spline');
plot(x2, y2, "b.-", H_2, B_2, "bo", 'MarkerFaceColor','y', 'LineWidth',2);
xlabel('H');
ylabel('B')
hold on; grid on;
% curve3 = polyfit(H_2, miu, 5);
% x3 = linspace(min(H_2), max(H_2), 50);
% f3 = polyval(curve3, x2);
% plot(x2, f3, "go-");

yyaxis right;
x3 = linspace(min(H_2), max(H_2),50);
y3 = interp1(H_2, miu, x3, 'spline');
plot(x3, y3, "r.-", H_2, miu, "ro",'MarkerFaceColor','y', 'LineWidth',2);
legend_2 = legend('B-H磁化曲线', '磁化实验值',"\mu 曲线", "\mu 实验值");
set(legend_2, 'Orientation', 'vertical', 'Box', 'off', 'Location', 'southeast');