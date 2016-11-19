%Part A
clear all;
close all;
clc;
links = zeros(3,4);
A = ones(4,4,length(links(:,1)));
T = ones(4,4,length(links(:,1)));

%go to home
theta = [ 0 90  -90 0 0 0  ];
links(1,:) = [ 150 degtorad(90) 475 degtorad(theta(1))];
links(2,:) = [ 720 0 0 degtorad(theta(2))];
links(3,:) = [ 805 0 0 degtorad(theta(3))];
% links(4,:) = [ 0    0 0   theta(4)];
% links(5,:) = [ 0  -90 0   theta(5)];
% links(6,:) = [ 0   90 0   theta(6)];
%get the A and T matrix
A = getA(links)
T = getT(A)

%plot
figure(1);
title('theta3 = pi')
plotArm(T)
% 

hold on;

    for theta2 = -50:5:50
        for theta3 = -45:5:45
            theta = [0 theta2 theta3 ];
            links(1,:) = [ 150 degtorad(90) 475 degtorad(theta(1))];
            links(2,:) = [ 720 0 0 degtorad(theta(2)+90)];
            links(3,:) = [ 805 0 0 degtorad(theta(3)-90 )];

            %get the A and T matrix
            A = getA(links);
            T = getT(A);
            plot3( T(1,4,end),0,T(3,4,end)-50,'g*');    
        end
    end
% 
% 

    %%
    
clear all;
close all;
clc;
%links = zeros(3,4);
%A = ones(4,4,length(links(:,1)));
%T = ones(4,4,length(links(:,1)));

%go to home
syms theta1 theta2 theta3 a1 a2 a3 d1
theta = [ theta1 theta2  theta3 ];
links(1,:) = [ a1  90 d1 theta1];
links(2,:) = [ a2  0 0   theta2];
links(3,:) = [ a3  0 0   theta3];
A = getA(links)
T = getT(A)
%%


