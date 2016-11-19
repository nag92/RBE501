%Nathaniel Goldfarb
%RBE501


clear all;
close all;
clc;

%define the constants of the arm
l1 = 0;
l2 = 70
l3 = 100;
alpha = 90;

%go to home
syms theta1 theta2 theta3 
links(1,:) = [ l1  degtorad(alpha) 0 degtorad(theta1)];
links(2,:) = [ l2 0 0 degtorad(theta2)];
links(3,:) = [ l3 0 0 degtorad(theta3- 90)];
%get the A and T matrix
A = getA(links);
T = getT(A);

%% Part 1

%Plot the work space
T_fig =  double(simplify(subs(T, [ theta1 theta2  theta3 ], [ 0 0 0 ])));
x = T_fig(1,4,end);
y = T_fig(2,4,end);
z = T_fig(3,4,end);

%cycle through different joint angels of the arm and save the location of
%the end effector. 
for t1 =  -90:20:90
    for t2 =  -50:20:50
        for t3 = 0-50:20:50
            T_fig =  double(simplify(subs(T, [ theta1 theta2  theta3 ], [ t1 t2 t3 ])));
            x = [x,T_fig(1,4,end)];
            y = [y,T_fig(2,4,end)];
            z = [z,T_fig(3,4,end)];   
        end
    end
end

%plot the X-Y plane
figure(1);
plot(x,y,'r*')
title('X-Y plane');
xlabel('x (cm)');
ylabel('y (cm)');

%plot the X-Z plane
figure(2);
plot(x,z,'r*')
title('X-Z plane');
xlabel('x (mm)');
ylabel('z (mm)');


%% Part 3
%
% DH table for the arm
% $$\left[\begin{array}{cccc} a & alpha & d & theta \\ 0 & \frac{\pi}{2} & 0 & \frac{\pi\, \mathrm{theta1}}{180}\\ 70 & 0 & 0 & \frac{\pi\, \mathrm{theta2}}{180}\\ 100 & 0 & 0 & \frac{\pi\, \left(\mathrm{theta3} - 90\right)}{180} \end{array}\right]$$
% 
 
%% Part 4

%The transforms for the leg are:
T
%% Part 5

%Calculat the Pose
T_fig =  double(simplify(subs(T, [ theta1 theta2  theta3 ], [ 0 0 0 ])));
%Plot the arm
figure(3);
plotArm(T_fig);
title('Home')
xlabel('x (mm)');
ylabel('y (mm)');
%% Part 6

f = [0 0 10]
%add a '1' so the math works
P_f = [ f 1]'
inv(T_fig(:,:,end))
vector = inv(T_fig(:,:,end))*P_f ;
%remove the last element
vector = vector(1:3)

%% Part 7
% the joints are going to be decoupled and solved geometericly 
% the elbow "up" config is going to be used, the opposite will also work. 

%Pose
Px = 80;
Py = 0;
Pz = -100;

%set up 
a1 = l2;
a2 = l3;
r =  (a1*a1 + a2*a2)

%Answer
t3_IK = -acosd( ( (Px*Px) + (Pz*Pz) - r)/(2*a1*a2)) 
t2_IK = atan2d(Pz,Px)-atan2d( (a2*sind(t3_IK)), (a1 + a2*cosd(t3_IK)))
t1_IK = atan2d(Py,Px)

%Plot the arm in the inverse configuration
figure(4);
T_IK =  double(simplify(subs(T, [ theta1 theta2  theta3 ], [ t1_IK t2_IK t3_IK ])));
%get the A and T matrix
plotArm(T_IK)
T_IK
title(['inverse solution t1= '  num2str(t1_IK) ' t2= ' num2str(t2_IK) ' t3= ' num2str(t3_IK)]) 

%% Part 8

%calculate the Jacobian
j1 = getRevJ( T(1:3,3,1), T(1:3,4,end),T(1:3,4,1));
j2 = getRevJ( T(1:3,3,2), T(1:3,4,end),T(1:3,4,2));
j3 = getRevJ( T(1:3,3,3), T(1:3,4,end),T(1:3,4,3));
J = [j1 j2 j3 ] 

%% Part 9
%Find the determinant of the Jacobian of matix, 

det(J(1:3,:))

%Since the determinant is zero the are no sigularities

%% Part10

J_s = simplify(subs(J, [ theta1 theta2  theta3 ], [ 0 0 0 ]))
jV = J_s(1:3,:);
xdot = [ 0 0 10 0 0 0 ]';
pinv(J_s)
thetadot = pinv(J_s)*xdot
%%

