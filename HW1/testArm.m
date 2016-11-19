

%% LaTeX Markup Example
% This is a table:
%
% <latex>
% \begin{tabular}{|c|c|} \hline
% $n$ & $n!$ \\ \hline
% 1 & 1 \\
% 2 & 2 \\
% 3 & 6 \\ \hline
% \end{tabular}
% </latex>

l = 1
h = 1;
link1  = [ 1 0 0 45];
link2 =  [ 0 90 0 0]
link3 =  [ 16 0 0 0]


links = [link1;link2;link3];
hold on;
set(gca,'YDir','Reverse')
set(gca,'XDir','Reverse')
grid on;
xlabel('X');
ylabel('Y');
zlabel('Z');
A = ones(4,4,length(links(:,1)));
T = ones(4,4,length(links(:,1)));
A = getA(links);
T = getT(A);
x = squeeze(T(1,4,:))
y = squeeze(T(2,4,:));
z = squeeze(T(3,4,:));
x = x';
y = y';
z = z';
xPlot = [0 x];
yPlot = [0 y];
zPlot = [0 z];
plot3(xPlot,yPlot,zPlot,'black','LineWidth',4);
plot3(xPlot(end),yPlot(end),zPlot(end),'x','LineWidth',8);