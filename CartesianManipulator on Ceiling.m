disp('Cartesian Manipulator on Ceiling')

syms a1 a2 a3 a4 d1 d2 d3

%% Link Lengths
a1 = 4;
a2 = 4;
a3 = 4;
a4 = 2;
d1 = 5;
d2 = 5;
d3 = 5;

%% D-H Parameters: theta, d, r, alpha, offset
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,0,0,pi/2,1,-a1]);
H0_1.qlim = [0 0];

H1_2 = Link([pi/2,0,0,pi/2,1,a2]);
H1_2.qlim = [0 d1];

H2_3 = Link([3*pi/2,0,0,pi/2,1,a3]);
H2_3.qlim = [0 d2];

H3_4 = Link([0,0,0,0,1,a4]);
H3_4.qlim = [0 d3];

%% Build the Mechanical Manipulator
Scara_V3 = SerialLink([H0_1 H1_2 H2_3 H3_4], 'name', 'CartesianManipulator on Ceiling')

Scara_V3.plot([0 0 0 0], 'workspace', [-10 10 -10 10 -15 10])

Scara_V3.teach
