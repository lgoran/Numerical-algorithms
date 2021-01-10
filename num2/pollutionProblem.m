function [  ] = pollutionProblem(  )
a=0;
b=60;
n=1500;
y0=[0,0.2,0,0.04,0,0,0.1,0.3,0.01,0,0,0,0,0,0,0,0.007,0,0,0]';
[x,y]=odjTrapez(@pollutionProblem_function,a,b,y0,n);
for i=20:-1:1
    figure(i)
    plot(x,y(i,:));
end