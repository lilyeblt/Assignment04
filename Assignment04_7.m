% TJ Lilyeblade
% 10/4/2017
% Assignment 04(7)

% Postal Code Extraction

clc; close all; clear all;

I = imread('envelopes/envelope3.jpg');
Imed1 = medfilt2(I,[100 100]);
Ifinal = Imed1 - I;
BW = Ifinal > 50;

[H, theta, rho] = hough(BW);

P = houghpeaks(H, 1);
lines = houghlines(BW, theta, rho, P);

angle = 90 + lines.theta;
Irot = imrotate(I, angle, 'crop');
Imed2 = medfilt2(Irot, [100 100]);
Ifinal2 = Imed2 - Irot;
BW2 = Ifinal2 > 50;

Isub = imcrop(BW2, [0 0 

figure, imshow(BW2), hold on;

% for k = 1:length(lines)
%     xy = [lines(k).point1; lines(k).point2];
%     plot(xy(:,1),xy(:,2), 'LineWidth',3,'color','g');
% end