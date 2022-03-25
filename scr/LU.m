 A1=[0.3/10^(15) 59.14 3 1 ;5.291 -6.130 -1 2;11.2 9 5 2 ;1 2 1 1 ;];
 b=[59.17;46.78;1;2];
 L=diag([1,1,1,1]);
 U=zeros(4);
for i=4:-1:1
 L(i,1)=A1(i,1)/A1(1,1);
end

for i=1:1:4
 U(1,i)=A1(1,i);   
end





for n=  2:1:4
   
for t=  n:4
     sumU=0;
for x=1:n-1
    sumU=sumU+L(n,x)*U(x,t);
end
U(n,t)=A1(n,t)-sumU;
end
for m=n+1:4
    sumL=0;
    for x=1:n-1
    sumL=sumL+L(m,x)*U(x,n);
    end
L(m,n)=(A1(m,n)-sumL)/U(n,n);
end
end
x=U\(L\b) ;
disp(x);
