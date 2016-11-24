function [ M ] = getM( q )
%GETM Summary of this function goes here
%   Detailed explanation goes here
m1 = 0.05;
m2 = 0.05;
l1 = 0.3;
l2 = 0.3;
g = 9.81;

M = [(m1+m2)*(l1)^2 + m2*(l2)^2 + 2*m2*l1*l2*cos(q(2)),  m2*(l2)^2 + m2*l1*l2*cos(q(2));...
      m2*(l2)^2 + m2*l1*l2*cos(q(2)),  m2*l2*l2 ];

end

