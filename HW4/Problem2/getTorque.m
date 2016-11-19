function [ u ] = getTorque( q,qd,qdd )
%GETTORQUE Summary of this function goes here
%   Detailed explanation goes here
m1 = 0.05;
m2 = 0.05;
l1 = 0.3;
l2 = 0.3;
g = 9.81;
q(1);

 
 M = [(m1+m2)*(l1)^2 + m2*(l2)^2 + 2*m2*l1*l2*cos(q(2)),  m2*(l2)^2 + m2*l1*l2*cos(q(2));...
      m2*(l2)^2 + m2*l1*l2*cos(q(2)),  m2*l2*l2 ]
 
 V = [ -m2*l1*l2*(2*qd(1)*qd(2) + qd(2)^2)*sin(q(2)); m2*l1*l2*(qd(1)^2)*sin(q(2))];
 
 
 G = [ (m1+m2)*g*l1*cos(q(1)) + m2*g*l2*cos(q(1)+q(2)); m2*g*l2*cos(q(1)+q(2))];
    
 
 %u = M*qdd + V + G;
 
end

