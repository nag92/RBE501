function [ G ] = getG( q)
%GETG Summary of this function goes here
%   Detailed explanation goes here

m1 = 0.05;
m2 = 0.05;
l1 = 0.3;
l2 = 0.3;
g = 9.81;
 G = [ (m1+m2)*g*l1*cos(q(1)) + m2*g*l2*cos(q(1)+q(2)); m2*g*l2*cos(q(1)+q(2))];


end

