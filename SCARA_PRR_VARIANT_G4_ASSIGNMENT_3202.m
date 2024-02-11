disp('SCARA - PRR Variant')

syms a1 a2 a3 d3

%% Link lengths

a1 = 5;

a2 = 3;

a3 = 2;

a4 = 5
 
%% Joint Variables
d1 = 3;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,0,a2,0,1,a1]);
H0_1.qlim = [0 d1];

H1_2 = Link([0,0,a3,0,0,0]);
H1_2.qlim = [-pi/2 pi/2];

H2_3 = Link([0,0,a4,0,0,0]);
H2_3.qlim = [-pi/2 pi/2];

Scara_PRR = SerialLink([H0_1 H1_2 H2_3], 'name', 'SCARA_PRRVariant')

Scara_PRR.plot([0,0,0], 'workspace', [-10 10 -10 10 -2 10])

Scara_PRR_V3.teach
