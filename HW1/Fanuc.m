
%set up memory 
links = zeros(6,4);
A = ones(4,4,length(links(:,1)));
T = ones(4,4,length(links(:,1)));

%go to home
theta = [0 0 0 0 0 0];
links(1,:) = [ 75 90 330 theta(1)];
links(2,:) = [ 300 0 0 theta(2)];
links(3,:) = [ 75 90 0 theta(3)];
links(4,:) = [ 0 -90 320 theta(4)];
links(5,:) = [ 0 90 0 theta(5)];
links(6,:) = [ 0 0 80 theta(6)];

%get the A and T matrix
A = getA(links)
T = getT(A)

%plot
figure(1);
title('home position')
plotArm(T)


%go to work position
theta = [0 75 30 135 -45 60];
links(1,:) = [ 75 90 330 theta(1)];
links(2,:) = [ .300 0 0 theta(2)];
links(3,:) = [ 75 90 0 theta(3)];
links(4,:) = [ 0 -90 320 theta(4)];
links(5,:) = [ 0 90 0 theta(5)];
links(6,:) = [ 0 0 80 theta(6)];
A = getA(links)
T = getT(A)

%plot the work position
figure(2)
plotArm(T)
title('work position')
