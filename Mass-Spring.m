clc
clear
format long



%% defining Soln function handles bys solving IVP's
f1= figure("Name","Part1---Analytic Method vs Numeric Methods", "NumberTitle","off");
f1.Position(:,[1,2])= [0,0];
subplot(1,2,1);
t=linspace(0,5,50);

f= @(x) cos(4.*t) ; % for b=0 , this is the soln

g=@(t) exp(-t).*( cos(sqrt(15).*t) + (1/sqrt(15)).*sin(sqrt(15).*t ));% soln for for b=2

h=@(t) exp(-4.*t) + (4.* exp(-4.*t).*t) ; %b=8

i=@(t) (4/3).*exp(-2.*t) -( (1./3).*exp(-8.*t));%b=10



%% Plot Functions
plot(t, f(t), "Marker","+", "LineWidth",1); hold on ;

plot(t, g(t),  "Marker","*",  "LineWidth",1); hold on;

plot(t, h(t),  "Marker","^",  "LineWidth",1); hold on;

plot(t, i(t), "Marker","x",  "LineWidth",1); hold off;


%% Axis Lable and Editing 
title("Hand-Solved Equation Plot");
xlabel("Time(t)", "FontSize", 15);
ylabel("x(t)", "FontSize", 15 );
grid on; grid minor;
legend('B=0', 'B=2', "B=8", "B=10");



%% Numeric Solutions to the IVP
t= linspace(0,5,100);
b=[0,2,8,10];
c=["+","*","^","x"];
d=["r","b","g", "c"];
subplot(1,2,2);
for i = 1:4
    
fun= @(t,y)[y(2); -b(i).*y(2)-16.*y(1)];
[t,y]=ode45(fun, t, [1;0]);
plot(t,y(:,1), "Marker", c(i),"LineWidth",1);hold on;

end
xlabel("Time(t)","FontSize", 15);
ylabel("x(t)","FontSize", 15);
title("Numerical Calculations Solution to Mass-Spring");
legend("B=0", "B=2","B=8","B=10");
grid on; grid minor;


%% Analysis of Result
%%the result are perfect match. Ode-45 works with RK4-RK5 methods which
%%seem to be very effective in approximating the numerical solutions

%% External Force Resonse

f2= figure("Name", "Resonance frequency", "NumberTitle","off");
f2.Position(:,[1,2])=[0,577];

%% Linear Vector Time Space 
t=linspace(0,100);
ampmax=zeros(1,4);
gamma= [0.2,0.42,0.6, 0.8]; % gamma value array
b=gamma(1);


%% Loop, ODE45 and Label
for i=1:4
    b=gamma(i);
    [r,z]=ode45(@(t,z) call(t,z,gamma(i)),t,[1;0]);
    plot(r,z(:,1), "Marker", c(i),"LineWidth",1);hold on;
    ampmax(i)= max(z(:,1));
end
grid on; grid minor; 
title("Amplitude Response VS Frequency of External Force");
xlabel("Time","FontSize", 15);
ylabel("Amplitude","FontSize", 15);
legend("Gamma=0.2","Gamma=0.42 ","Gamma=0.6","Gamma=0.8");

%% Bar Graph and Amplitude

f3=figure("Name", "Max-Amplitude For each given gamma", "NumberTitle","off");
for i=1:4
bar(gamma(i)./(2.*3.14159265), ampmax(i), 0.02); hold on;
end
xlabel("Frequency of the External Force");
ylabel("Amplitude response");
title("Max-Amplitude Prediction through numerical solutions");
legend("f=0.031 Amp= 6.0466","f=0.066 Amp= 11.4504","f=0.095 Amp= 6.0755","f=0.127 Amp=2.4403");
grid on; grid minor;

%% Amplitude Vs Frequency graph
f4=figure("Name", "Amp VS Freq", "NumberTitle","off");
f4.Position(:,[1,2])= [500,500];
f= linspace(0,1);
Amp= @(f) 1./sqrt((0.2-f.^2).^2 +0.04.*(f.^2) );

plot(f./(2.*3.14159265), Amp(f), "LineWidth",1); 
grid on; grid minor;
xlabel("Frequency of the External Force");
ylabel("Amplitude response");
title("Amplitude VS Frequency");
legend("Max Amp occours at 0.0636619 frequency value  ");
%% Returns a Ext Force Diff Eq
function dPdt= call(t,y,val)
dPdt= [y(2); cos(val.*t)-(y(1)./5)-(y(2)./5)]; 

end
