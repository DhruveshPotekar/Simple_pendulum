clear all
close all
clc

%duration of time
t = [0 30];

%x0 has two values, first one is initial condition for angular displacment and second one is for angular velcity
x0 = [1 0];

%ode45 is a ODE solver. 
%Syntax[t,y] = ode45(odefun,tspan,y0), where tspan = [t0 tf], integrates the system of differential equations y'=f(t,y) from t0 to tf with initial conditions y0.
%The ode45 can only solve a first order ODE.
%Therefore to solve a higher order ODE, the ODE has to be first converted to a set of first order ODEs.
[t, x] = ode45('pendulam_fun',t,x0);


%figure for angular displacement
figure('Name','Angular_Displacement_vs_Time','NumberTitle','off')

plot(t,x(:,1),'color','r','LineWidth',2);

xlabel('Time','FontSize',12,'FontWeight','bold');
ylabel('Angular Displacement','FontSize',12,'FontWeight','bold');


%figure for angular velocity
figure('Name','Angular_Velocity_vs_Time','NumberTitle','off')

plot(t,x(:,2),'color','b','LineWidth',2);

xlabel('Time','FontSize',12,'FontWeight','bold');
ylabel('Angular Velocity','FontSize',12,'FontWeight','bold');

%animation_code
%for loop being used for capturing each time interval 
for i=1:length(t)
  
  L = 1;
  X0=0;
  Y0=0;
  
  %to calculate the co-ordinates of bob at time t
  X1 = L* sin(x(i));
  Y1 = -L* cos(x(i));
  
  %making a fixed plane
  figure(3);
  plot([-1 1],[0 0],'LineWidth',2,'color','b');
  hold on
  %string of pendulam
  plot([0 X1],[0 Y1],'LineWidth',2,'color','k');
  hold on
  
  %to plot the bob at different time interval
  plot(X1,Y1,'o','markersize',20,'markerfacecolor','r');
  grid on
  
  %to specify the axis inside which the entire system will move
  axis([-2 2 -2 1])
  
  %to pause execution for given time before continuing
  pause(0.001);
  hold off
  
  %to captures the current axes as it appears on the screen as a movie frame
  F(i) = getframe(gcf); 
  
end


%to write video data to an AVI file with Motion JPEG compression
video = VideoWriter('pendulam.avi','Uncompressed AVI');
video.FrameRate = 60;

open(video)
%to write data from an array to the video file associated with video
writeVideo(video,F);
close(video)


