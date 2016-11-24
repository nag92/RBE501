clear all;
close all;
clc;

m1 = .05;
m2 = .05;

% intial and final positions in meters
[x2_i(1,1),x2_i(2,1)] = IK(.3,.45)
[x2_f(1,1),x2_f(2,1)] = IK(-.3,.45)

x_path = planTraj(x2_i(1),x2_f(1),10)
y_path = planTraj(x2_i(2),x2_f(2),10)