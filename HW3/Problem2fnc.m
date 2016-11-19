%% Problem 2
function [ tau_solve ] = Problem2fnc( M1,M2,L1,L2,theta1,theta2 )
syms l1 l2 m1 m2 g  t1(t) t2(t) t1d(t) t2d(t)  t1dd(t) t2dd(t) I1 I2
syms t1_temp t2_temp 

%%
% Get the links

%%
% Get the link 1 positions and velocity 

x1 = [ l1*cos(t1(t));...
       l1*sin(t1(t))];

x2 = [ x1(1) + l2*cos(t1(t) + t2(t));...
       x1(2) + l2*cos(t1(t) + t2(t))];
%%   
% Get the link 2 positions and velocity
x1_d = diff(x1,t);
x1_d = subs(x1_d, {diff(t1(t), t) }, {t1d(t)});


x2_d = diff(x2,t);

x2_d = subs(x2_d, {diff(t2(t), t) }, {t2d(t)});

%% 
% Solve fot the interia of the links
I1 = (1/3)*m1*(l1)^2;
I2 = (1/12)*m2*(L2)^2;

%%
% sovle for the kinetic engery including the rotationa energery

K1 = 0.5*m1*(x1_d.'*x1_d) + 0.5*I1*t1(t)^2;

K2 = 0.5*m1*(x2_d.'*x2_d) + 0.5*I1*(t1(t)+t2(t))^2;

%%
% solve for the potentional energy of the arm
P1 = m1*g*(0.5*l1)*sin(t1(t));
P2 = m2*g*( l1*sin(t1(t)) + .5*l2*sin(t1(t)+t2(t)));

%%
% get the largrange
L = simplify((K1+K2)-(P1+P2));

%%
% get dL/dq for theta 1,2
temp = subs(L,{t1(t)},{t1_temp});
dL_dt1 = diff( temp  , t1_temp);
dL_dt1 = subs(dL_dt1,{t1_temp},{t1(t)});

temp = subs(L,{t2(t)},{t2_temp});
dL_dt2 = diff( temp  , t2_temp);
dL_dt2 = subs(dL_dt2,{t2_temp},{t2(t)});


%%
% get dL/dqd for theta 1,2
temp = subs(L,{t1d(t)},{t1_temp});
dL_ddt1 = diff( temp  , t1_temp);
dL_ddt1 = subs(dL_ddt1,{t1_temp},{t1d(t)});

temp = subs(L,{t2d(t)},{t2_temp});
dL_ddt2 = diff( temp  , t2_temp);
dL_ddt2 = subs(dL_ddt2,{t2_temp},{t2d(t)});
%%
% get d(dL/dqd)/dt for theta 1,2
d_dt_1 = diff(dL_ddt1,t);
d_dt_1 = subs( d_dt_1, {diff(t1d(t), t),diff(t2d(t), t)},{t1dd(t), t2dd(t)});
d_dt_1 = subs(d_dt_1, {diff(t1(t), t) , diff(t2(t), t) }, {t1d(t),t2d(t)});
%
d_dt_2 = diff(dL_ddt2,t);
d_dt_2 = subs( d_dt_2, {diff(t1d(t), t),diff(t2d(t), t)},{t1dd(t), t2dd(t)});
d_dt_2 = subs(d_dt_2, {diff(t1(t), t) , diff(t2(t), t) }, {t1d(t),t2d(t)});
%%
% get tau 1,2
tau_1 =simplify( d_dt_1 - dL_dt1)
tau_2 =simplify( d_dt_2 - dL_dt2)
tau = [tau_1;tau_2];
%%
% plug in values
tau_solve = simplify(subs(tau, {m1,m2,l1,l2,t1(t),t2(t)},{M1,M2,L1,L2,theta1,theta2 }))

end

