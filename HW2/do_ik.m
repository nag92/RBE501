%EXTRA credit
function [ output_args ] = do_ik( x,y,z )
%IK for three link arm
clear all;
close all;
clc;
links = zeros(3,4);
A = ones(4,4,length(links(:,1)));
T = ones(4,4,length(links(:,1)));

x_prime = 170;
z_prime = 475


a1 = 720;
a2 = 805 

Px = x - x_prime;
Py = y;
Pz = z - z_prime

theta3 = acosd( (Px^2 + Pz^2 - a1^2 - a2^2)/(2*a1*a2))
theta2 = atan2d(Pz,Px)-atan2d( (a2*sind(theta3)), (a1 + a2*cosd(theta3)))
theta1 =  atan2d(Py,Px)

theta = [ theta1 theta2 theta3  ];
links(1,:) = [ 150 degtorad(90) 475 degtorad(theta(1))];
links(2,:) = [ 720 0 0 degtorad(theta(2))];
links(3,:) = [ 805 0 0 degtorad(theta(3))];
% links(4,:) = [ 0    0 0   theta(4)];
% links(5,:) = [ 0  -90 0   theta(5)];
% links(6,:) = [ 0   90 0   theta(6)];
%get the A and T matrix
A = getA(links)
T = getT(A)

%plot
figure(1);
title('theta3 = pi')
plotArm(T)
% 

end

