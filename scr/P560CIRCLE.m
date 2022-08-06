clc;
clear;
mdl_puma560;
p560.tool=transl(0,0,0.1)

t = (0:0.4:20)'; count = length(t);center = [0 0 0.8];r= 0.25;
theta = t*(pi/t(end));
points =(center + r*[cos(theta) sin(theta) zeros(size(theta))])';
 plot3(points(1,:),points(2,:),points(3,:),'r')


hold on
xlabel('x/米','FontSize',12);
ylabel('y/米','FontSize',12);
zlabel('z/米','FontSize',12);
 for i = 1:size(points,2)
 pause(0.01)
bx = points(1,i);
 by = points(2,i);
 bz =points(3,i); 
 targetPos = [bx by bz]
 TR=transl( targetPos)
 disp([bx by bz])
 rpy=tr2rpy(TR)
 disp(rpy)
 hold on
 grid on
 figure(1)
hold on
 q=p560.ikine(TR);
p560.plot(q);
end 

