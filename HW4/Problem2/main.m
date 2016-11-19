%% Problem 2 


%% A
clear all;
close all;
clc;


% intial and final positions in meters
x2_i = [0.3;0.45];
x2_f = [-0.3;0.45];
time = 5;%s

x_path = planTraj(x2_i(1),x2_f(1),time);
y_path = planTraj(x2_i(2),x2_f(2),time);

p = [];
v = [];
a = [];
for t = 0:0.1:5
    [x,xd,xdd] = getKin(x_path,t);
    [y,yd,ydd] = getKin(y_path,t);
    
    p = [ p, sqrt( x*x + y*y)];
    v = [ v, sqrt( xd*xd + yd*yd)];
    a = [ a, sqrt( xdd*xdd + ydd*ydd)];
end

hold on;
axis([0 70 -0.5 1.5])
plot(p)
plot(v)
plot(a)
sim('problem2')
%pos = [0 ;O1(1); O2(1)];            
%Y_links = [0 ;O1(2); O2(2)];
%plot(Xlinks, Ylinks,'bd-')

