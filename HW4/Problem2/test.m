x2_i = [0.3;0.45];
x2_f = [-0.3;0.45];
time = 5;%s

x_path = planTraj(x2_i(1),x2_f(1),time);
y_path = planTraj(x2_i(2),x2_f(2),time);
