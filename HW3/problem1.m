
%% Problem 1
% We can ignore link1 because it does not move
% 
%
clear all;
close all;
clc;
%% 
% varibles
syms l1 l2 l3 m1 m2 g  t1(t) t2(t) t3(t) t1d(t) t2d(t) t3d(t) t1dd(t) t2dd(t) t3dd(t) 
syms t1_temp t2_temp t3_temp
%%
% Get the links

x1 = [ l2*cos(t2(t))*cos(t1(t));...
       l2*cos(t2(t))*sin(t1(t));...
       l1 + l2*sin(t2(t))];

x2 = [ x1(1) + l3*cos(t2(t) + t3(t));...
       x1(2) + l3*cos(t2(t) + t3(t));...
       x1(3) + l3*sin(t2(t) + t3(t))];
%%
% get the velocities
x1_d = diff(x1,t);
x1_d = subs(x1_d, {diff(t1(t), t) , diff(t2(t), t)}, {t1d(t),t2d(t)});

x2_d = diff(x2,t);
x2_d = subs(x2_d, {diff(t1(t), t) , diff(t2(t), t), diff(t3(t), t) }, {t1d(t),t2d(t),t3d(t)});
%%
% get the Kinetic energy 
K1 = 0.5*m1*(x1_d.'*x1_d);
K2 = 0.5*m1*(x2_d.'*x2_d);
%%
% get the Potential energy
P1 = m1*g*x1(3);
P2 = m1*g*x2(3);
%%
% get the Lagrange 
L = (K1+K2) - (P1+P2);
%%
% get dL/dq
temp = subs(L,{t1(t)},{t1_temp});
dL_dt1 = diff( temp  , t1_temp);
dL_dt1 = subs(dL_dt1,{t1_temp},{t1(t)});

temp = subs(L,{t2(t)},{t2_temp});
dL_dt2 = diff( temp  , t2_temp);
dL_dt2 = subs(dL_dt2,{t2_temp},{t2(t)});

temp = subs(L,{t3(t)},{t3_temp});
dL_dt3 = diff( temp  , t3_temp);
dL_dt3 = subs(dL_dt3,{t3_temp},{t3(t)});
%%
% get dL/dq_d

temp = subs(L,{t1d(t)},{t1_temp});
dL_ddt1 = diff( temp  , t1_temp);
dL_ddt1 = subs(dL_ddt1,{t1_temp},{t1d(t)});

temp = subs(L,{t2d(t)},{t2_temp});
dL_ddt2 = diff( temp  , t2_temp);
dL_ddt2 = subs(dL_ddt2,{t2_temp},{t2d(t)});

temp = subs(L,{t3d(t)},{t3_temp});
dL_ddt3 = diff( temp  , t3_temp);
dL_ddt3 = subs(dL_ddt3,{t3_temp},{t3d(t)});
%%
% Get the d/dt(dL/dq_d)
d_dt_1 = diff(dL_ddt1,t);
d_dt_1 = subs( d_dt_1, {diff(t1d(t), t),diff(t2d(t), t),diff(t3d(t), t)},...
                         {t1dd(t), t2dd(t), t3dd(t)});
d_dt_1 = subs(d_dt_1, {diff(t1(t), t) , diff(t2(t), t), diff(t3(t), t) }, {t1d(t),t2d(t),t3d(t)});
%
d_dt_2 = diff(dL_ddt2,t);
d_dt_2 = subs( d_dt_2, {diff(t1d(t), t),diff(t2d(t), t),diff(t3d(t), t)},...
                         {t1dd(t), t2dd(t), t3dd(t)});
d_dt_2 = subs(d_dt_2, {diff(t1(t), t) , diff(t2(t), t), diff(t3(t), t) }, {t1d(t),t2d(t),t3d(t)});
%
d_dt_3 = diff(dL_ddt3,t);
d_dt_3 = subs( d_dt_3, {diff(t1d(t), t),diff(t2d(t), t),diff(t3d(t), t)},...
                         {t1dd(t), t2dd(t), t3dd(t)});
d_dt_3 = subs(d_dt_3, {diff(t1(t), t) , diff(t2(t), t), diff(t3(t), t) }, {t1d(t),t2d(t),t3d(t)});

% get torques 

tau_1 = d_dt_1 - dL_dt1;
tau_2 = d_dt_2 - dL_dt2;
tau_3 = d_dt_3 - dL_dt3;

tau = [tau_1; tau_2  ;tau_3]
factored_tau = collect( tau, [t1dd(t) t2dd(t) t3dd(t) ])

M_qdd = subs( tau, {t1d(t) t2d(t) t3d(t) g}, {0 0 0 0});
M = collect( M_qdd, [t1dd(t) t2dd(t) t3dd(t) ])

V = subs( tau, {g}, {0}) - M_qdd
C = collect( V, [t1d(t) t2d(t) t3d(t) ])

G = tau - V - M_qdd






