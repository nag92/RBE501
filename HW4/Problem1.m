%%
% Nathaniel Goldfarb
% RBE501
% HW4


%% Problem 1
% To make a trajectory to get to the three location, three seperate
% polynomals have to be made. 
% 1. q0->q1
% 2. q1->q2
% 3. q2->q3
%
% This problem can be solved using matrix and inverting them
% There are 12 constraints so a 11th order polynomial is need (12-1) = 11
% first the positions are goint to be converted  
format long
p0 = 20*(pi/180);
p1 = 70*(pi/180);
p2 = 100*(pi/180);
p3 = 120*(pi/180);
dt = 1;
t1 = 0;
t2 = t1+dt;
t3 = t2+dt;
t4 = t3+dt;

% set up the matrix
A = [ 1, t1, t1^2, t1^3, t1^4, t1^5, t1^6, t1^7,t1^8,t1^9, t1^10,t1^11;...
      0,  1, 2*t1, 3*t1^2, 4*t1^3, 5*t1^4, 6*t1^5, 7*t1^6, 8*t1^7, 9*t1^8, 10*t1^9,11*t1^10;...
      0,  0, 2, 6*t1, 12*t1^2, 20*t1^3, 30*t1^4, 42*t1^5, 56*t1^6, 72*t1^7, 90*t1^8,110*t1^9;...
     
      1, t2, t2^2, t2^3, t2^4, t2^5, t2^6, t2^7,t2^8,t2^9, t2^10,t2^11;...
      0,  1, 2*t2, 3*t2^2, 4*t2^3, 5*t2^4, 6*t2^5, 7*t2^6, 8*t2^7, 9*t2^8, 10*t2^9,11*t2^10;...
      0,  0, 2, 6*t2, 12*t2^2, 20*t2^3, 30*t2^4, 42*t2^5, 56*t2^6, 72*t2^7, 90*t2^8,110*t2^9;...
      
      1, t3, t3^2, t3^3, t3^4, t3^5, t3^6, t3^7,t3^8,t3^9, t3^10,t3^11;...
      0,  1, 2*t3, 3*t3^2, 4*t3^3, 5*t3^4, 6*t3^5, 7*t3^6, 8*t3^7, 9*t3^8, 10*t3^9,11*t3^10;...
      0,  0, 2, 6*t3, 12*t3^2, 20*t3^3, 30*t3^4, 42*t3^5, 56*t3^6, 72*t3^7, 90*t3^8,110*t3^9;...
      
      1, t4, t4^2, t4^3, t4^4, t4^5, t4^6, t4^7,t4^8,t4^9, t4^10,t4^11;...
      0,  1, 2*t4, 3*t4^2, 4*t4^3, 5*t4^4, 6*t4^5, 7*t4^6, 8*t4^7, 9*t4^8, 10*t4^9,11*t4^10;...
      0,  0, 2, 6*t4, 12*t4^2, 20*t4^3, 30*t4^4, 42*t4^5, 56*t4^6, 72*t4^7, 90*t4^8,110*t4^9]

B = [p0;0;0;p1;0;0;p2;0;0;p3;0;0];
% solve
x = A\B
time = 0:.01:3;
coef = fliplr(x');
y_list = polyval(coef, time);
plot(time,y_list);
xlabel('time (s)');
ylabel('joint angle (rad)');
title('Joint position')
%%
coef_v = coef(1:end-1).*[ 11,10,9,8,7,6,5,4,3,2,1];
coef_a = coef_v(1:end-1).*[ 10,9,8,7,6,5,4,3,2,1];
%%
figure(2)
y_list = polyval(coef_v, time);
plot(time,y_list);
xlabel('time (s)');
ylabel('Velocity(rad/s)');
title('Joint velocity')
%%
figure(3)
y_list = polyval(coef_a, time);
plot(time,y_list);
xlabel('time (s)');
ylabel('joint angle (rad/s^2)');
title('Joint acceleration')
%%


