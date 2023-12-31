%% 用于计算涉及到的相关参数
%%
M = 10; %小车的质量
m = 1 ; %摆杆的质量
l= 1 ; % 摆杆的长度的一半，总长为2l=2m
g=10; %重力加速度

I=(4/3)*(m*l*l); %摆杆的转动惯量

a23=-(m^2)*g*(l^2)/(I*(M+m)+M*m*l*l);

a43=m*g*l*(M+m)/(I*(M+m)+M*m*l*l);

b21=(I+m*l*l)/(I*(M+m)+M*m*l*l);

b41=-m*l/(I*(M+m)+M*m*l*l);

A=[0 1 0 0;
    0 0 a23 0;
    0 0 0 1;
    0 0 a43 0];

B=[0;
    b21;
    0;
    b41];

C=[1 0 0 0;
    0 0 1 0];

D=[0;0];

%% 计算 能控性
Sc=[B A*B A^2*B A^3*B];
rank(Sc)
%%
J=[-5 -5 -1+j*sqrt(3) -1-j*sqrt(3)];
K=acker(A,B,J)；

%%
J_=3*J;
L=place(A',C',J_)

%% LQR控制
Q=eye(4);
R=eye(1);
K_lqr=lqr(A,B,Q,R)

