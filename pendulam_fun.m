function [xdot] = pendulam_fun(t,x)

g = 9.81;   %Accleration due to gravity
L = 1;      %Length of string in m
m = 1;      %Mass in kg
b = 0.2;   %Damping coefficient
xdot = zeros(2,1);

%angular displacement
xdot(1) = x(2);
%angular velocity
xdot(2) = -(g/L)*sin(x(1))-(b/m)*x(2);

end
