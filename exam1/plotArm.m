function [ toPlot ] = plotArm( T)
%Plots a arm in 3D, along with the joint location and the end effector


x = squeeze(T(1,4,:));
y = squeeze(T(2,4,:));
z = squeeze(T(3,4,:));
N = 3;
x = round(x',N);
y = round(y',N);
z = round(z',N);

xPlot = [0 x];
yPlot = [0 y];
zPlot = [0 z];

xlabel('x')
ylabel('y') 
zlabel('z')
hold on
view(3)
plot3(xPlot,yPlot,zPlot,'black','LineWidth',4);
plot3(xPlot,yPlot,zPlot,'r*','LineWidth',2);
plot3(xPlot(end),yPlot(end),zPlot(end),'mx','LineWidth',8);
end

