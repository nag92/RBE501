%Part B
x_prime = 170;
z_prime = 475

x = 500
y = 100;
z = 1500;

a1 = 720;
a2 = 805 

Px = x - x_prime;
Py = y;
Pz = z - z_prime

theta3 = acosd( (Px^2 + Pz^2 - a1^2 - a2^2)/(2*a1*a2))
theta2 = atan2d(Pz,Px)-atan2d( (a2*sind(theta3)), (a1 + a2*cosd(theta3)))
theta1 =  atan2d(Py,Px)



%%

%Part D
syms theta1 theta2 theta3
theta = [ theta1 theta2  theta3 ]
links(1,:) = [ 150 degtorad(90) 475 degtorad(theta(1))];
links(2,:) = [ 720 0 0 degtorad(theta(2))];
links(3,:) = [ 805 0 0 degtorad(theta(3))];
A = getA(links)
T = getT(A)

 %Get the Jacobain
[o,On] = getO(T);

o;
z = getZ(T);
j1 = getRevJ(z(:,1),On,o(:,1));
j2 = getRevJ(z(:,2),On,o(:,2));
j3 = getRevJ(z(:,3),On,o(:,3))

%Part E
J = [j1 j2 j3 ] ;
jV = J(1:3,:);
xdot = [ 5 5 10 0 0 0]'
pinv(J)
thetadot = pinv(J)*xdot
