M=2;
m=1;
g=10;
l=1;
I=4/3*m*l^2;

a23=-m*m*g*l/(I*(M+m)+M*m*l*l);
a43=m*g*l*(M+m)/(I*(M+m)+M*m*l*l);
b2=(I+m*l*l)/(I*(M+m)+M*m*l*l);
b4=-m*l/(I*(M+m)+M*m*l*l);

A=[0 1 0 0;
    0 0 a23 0;
    0 0 0 1;
    0 0 a43 0];

B=[0;b2;0;b4];

C=[1 0 0 0];

Sc=[B A*B A^2*B A^3*B];
fprintf('rank(Sc)=%d\n',rank(Sc));

%%
Qo=[C;
    C*A;
    C*A^2;
    C*A^3];
fprintf('rank(Qo)=%d\n',rank(Qo));
%%
disp('eig(A)=');
eig(A)
%%
P=lyap(A',eye(4));
%%
% 调节器的极点配置问题
J = [-1 -2 -1+j*sqrt(3) -1-j*sqrt(3)];
K1 = acker(A,B,J); 
K2 = place(A,B,J); 
disp('K1 = ');
disp(K1);
disp('K2 = ');
disp(K2);
%% 观测器设计
A_ = A';
B_ = C';
C_ = B';
%配置的极点
J_ = [-2 -6 -2-j*2*sqrt(3) -2+j*2*sqrt(3)];
L = (acker(A_, B_, J_))';
disp('Ke = ');
disp(L);
%%
Aaa = A(1, 1);
Aab = A(1, 2:end);
Aba = A(2:end, 1);
Abb = A(2:end, 2:end);
J_j = [-6 -2+j*2*sqrt(3) -2-j*2*sqrt(3)];
Ke_j = (acker(Abb',Aab',J_j))';
disp('Ke_j = ');
disp(Ke_j);
%%
Q = eye(4);
R = eye(1);
K_lqr = lqr(A,B,Q,R);
disp('K_lqr = ');
disp(K_lqr);

%%
A_ = A';
B_ = C';
C_ = B';
%配置的极点
J_ = [-2 -6 -2-j*2*sqrt(3) -2+j*2*sqrt(3)];
L = (acker(A_, C_, J_))';
disp('Ke = ');
disp(LL);



