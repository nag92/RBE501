clear all;
close all;
clc;

%define the links
l1 = 0;
l2 = 70
l3 = 100;

%allocate some memory
links = zeros(3,4);
A = ones(4,4,length(links(:,1)));
T = ones(4,4,length(links(:,1)));

%go to home
theta = [ 0 0 0 ];
links(1,:) = [ l1 degtorad(90) 0 degtorad(theta(1))];
links(2,:) = [ l2 0 0 degtorad(theta(2))];
links(3,:) = [ l3 0 0 degtorad(theta(3) - 90)];
%get the A and T matrix
A = getA(links)
T = getT(A)

%plot the arm
figure(1);
title('Home')
plotArm(T)

%Part 1
%Plot the work space
x = T(1,4,end)
y = T(2,4,end)
z = T(3,4,end)

for theta1 = -90:10:90
    for theta2 =  -45:10:45
        for theta3 = -45:10:45
            theta = [ theta1 theta2 theta3  ];
            links(1,:) = [ l1 degtorad(90) 0 degtorad(theta(1))];
            links(2,:) = [ l2 0 0 degtorad(theta(2))];
            links(3,:) = [ l3 0 0 degtorad(theta(3) - 90)];
            %get the A and T matrix
            A = getA(links);
            T = getT(A);
            x = [x,T(1,4,end)];
            y = [y,T(2,4,end)];
            z = [z,T(3,4,end)];   
        end
    end
end

%plot the X-Y plane
figure(2);
plot(x,y,'r*')
title('X-Y plane');
xlabel('x (cm)');
ylabel('y (cm)');

%plot the X-Z plane
figure(3);
plot(x,z,'r*')
title('X-Z plane');
xlabel('x (mm)');
ylabel('z (mm)');

%%

%Part 7
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
t3 = -acosd( ( (Px*Px) + (Pz*Pz) - r)/(2*a1*a2)) 
t2 = atan2d(Pz,Px)-atan2d( (a2*sind(t3)), (a1 + a2*cosd(t3)))
t1 = atan2d(Py,Px)

%Plot the arm in the inverse configuration
figure(4);
theta = [ t1 t2 t3 ];
links(1,:) = [ l1  degtorad(90) 0 degtorad(t1)];
links(2,:) = [ l2 0 0 degtorad(t2)];
links(3,:) = [ l3 0 0 degtorad(t3)];
%get the A and T matrix
A = getA(links);
T = getT(A)
plotArm(T)
title(['inverse solution t1= '  num2str(t1) ' t2= ' num2str(t2) ' t3= ' num2str(t3)]) 

%%

%Part 8

%set up the arm
l1 = 0;
l2 = 70
l3 = 100;
syms theta1 theta2 theta3 
theta = [ theta1 theta2  theta3 ];
links(1,:) = [ l1  degtorad(90) 0 degtorad(theta1)];
links(2,:) = [ l2 0 0 degtorad(theta2)];
links(3,:) = [ l3 0 0 degtorad(theta3- 90)];
%get the A and T matrix
A = getA(links);
T = getT(A)

%calculate the Jacobian


j1 = getRevJ( T(1:3,3,1), T(1:3,4,end),T(1:3,4,1));
j2 = getRevJ( T(1:3,3,2), T(1:3,4,end),T(1:3,4,2));
j3 = getRevJ( T(1:3,3,3), T(1:3,4,end),T(1:3,4,3));
J = [j1 j2 j3 ] 

%%
%Part10
J_s = simplify(subs(J, [ theta1 theta2  theta3 ], [ 0 0 0 ]))
jV = J_s(1:3,:);
xdot = [ 0 0 10 0 0 0 ]';
pinv(J_s)
thetadot = pinv(J_s)*xdot

