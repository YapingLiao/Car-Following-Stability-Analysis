%% Define Simulations Parameters:

b= 20;
a = 0.5; 
vm = 9.72;
d0 = 2.23;
params = [b,a,vm,d0];
RingRoad_Params.Road_Length = 111.7961;
RingRoad_Params.number_cars = 20;

L_phys = 205.9363;
l_car = 4.5;
L_Eff = 

RingRoad_Params.trajectory_time = 500;
RingRoad_Params.dt = .05;

L = RingRoad_Params.Road_Length;
n = RingRoad_Params.number_cars;
tf = RingRoad_Params.trajectory_time; % final time of trajectory computation
dt = RingRoad_Params.dt; % Time step [s]
numSteps = tf/dt;
times = dt:dt:tf;


%% Initialize States:

s_star = RingRoad_Params.Road_Length/RingRoad_Params.number_cars;
% v_star = vm*(tanh(s_star./d0-2)+tanh(2))/(1+tanh(2));
v_star = 0;
s_init = ones(n,1)*s_star;
v_init = ones(n,1)*v_star;
p_init = cumsum(s_init);


%% Simulate:
clc
[Speeds,Positions,Spacings] = ...
    Run_Ring_Road(RingRoad_Params,params,s_init,p_init,v_init);
disp('Simulation Finished')
%% Plot:
figure()
hold on
for v=1:n
    c = Speeds(v,:);
    scatter(times,Positions(v,:),5,c)
end

figure()
plot(Speeds')





