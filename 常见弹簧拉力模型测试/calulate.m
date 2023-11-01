%%
M=2;
k=1;
c=1;

A=[0 1;
    -0.5 -0.5];

B=[0;
    0.5];

C=[1 0];

%%
eig(A)
%%
Sc=[B A*B];
rank(Sc)
%%
Qo=[C;
    C*A];
rank(Qo)
%%
J=[-1+j*sqrt(3) -1-j*sqrt(3)];
K=place(A,B,J)

%%
J_=3*J;
L=place(A',C',J_)'