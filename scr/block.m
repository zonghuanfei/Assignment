x=[-1/2,1/2,1/2,-1/2,-1/2,-1/2,1/2,1/2,-1/2,1/2,1/2,-1/2,-1/2,-1/2,1/2,1/2];
y=[-1/2,-1/2,1/2,1/2,1/2,-1/2,-1/2,1/2,1/2,1/2,1/2,1/2,-1/2,-1/2,-1/2,-1/2];
z=[-1/2,-1/2,-1/2,-1/2,1/2,1/2,1/2,1/2,1/2,1/2,-1/2,-1/2,-1/2,1/2,1/2,-1/2];
V=[x;y;z];
figure
h=plot3(V(1,:),V(2,:),V(3,:));
axis([-5,5,-5,5,-5,5])
xlabel('x');
ylabel('y');
zlabel('z');
%沿y旋转
for a=linspace(0,pi,100)
    Ry=[cos(a),0,sin(a);0,1,0;-sin(a),0,cos(a)];
    T=Ry*V;
    set(h,'xdata',T(1,:),'Ydata',T(2,:),'Zdata',T(3,:))
    pause(0.05)
end
%沿z旋转
for b=linspace(0,pi,100)
    Rz=[cos(b),-sin(b),0;sin(b),cos(b),0;0,0,1];
    U=Rz*T;
    set(h,'xdata',U(1,:),'Ydata',U(2,:),'Zdata',U(3,:))
    pause(0.05)
end
%沿x旋转
for c=linspace(0,pi,100)
    Rx=[1,0,0;0,cos(c),-sin(c);0,sin(c),cos(c)];
    S=Rx*U;
    set(h,'xdata',S(1,:),'Ydata',S(2,:),'Zdata',S(3,:))
end