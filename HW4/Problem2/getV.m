function [ V ] = getV( q, qd )
%GETV Summary of this function goes here
%   Detailed explanation goes here
m1 = 0.05;
m2 = 0.05;
l1 = 0.3;
l2 = 0.3;
g = 9.81;

 V = [ -m2*l1*l2*(2*qd(1)*qd(2) + qd(2)^2)*sin(q(2)); m2*l1*l2*(qd(1)^2)*sin(q(2))];


end

