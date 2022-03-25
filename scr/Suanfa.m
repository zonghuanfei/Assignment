


A2=[10 -7 0 1 8;-3 2.099999999999999 -6 2 5.900000000000001;5 -1 5 -1 5;0 1 0 2 1;];
for k=1:1:3
m=k;
max=abs(A2(k,k));
for i=k:4

 if max<abs(A2(i,k))
     m=i;
     max=abs(A2(i,k));
end
end

for j=k:5
temp= A2(k,j) ;
A2(k,j)=A2(m,j);
A2(m,j)=temp;
end
disp(A2)
for i=k+1:1:4
    for j=k:1:5
A2(i,j)=A2(i,j)-(A2(i,k)/A2(k,k))*A2(k,j);
    end
end
end
 U=A2;

A2=[10 -7 0 1 8;-3 2.099999999999999 -6 2 5.900000000000001;5 -1 5 -1 5;0 1 0 2 1;];
 n=[1,1,1,1];
L= diag(n);
q=A2(1,1);
    for j=1:4
L(j,1)=A2(j,1)/q;
    end
    L(3,2)=(A2(3,2)-L(3,1)*U(1,2))/U(2,2);
L(4,2)=(A2(4,2)-L(4,1)*U(1,2))/U(2,2);
L(4,3)=(A2(4,3)-L(4,1)*U(1,3)-L(4,2)*U(2,3))/U(3,3);
 disp(L);
 %高斯消元法
 A1=[0.3/10^(15) 59.14 3 1 59.17;5.291 -6.130 -1 2 46.78;11.2 9 5 2 1;1 2 1 1 2;];

for i=1:1:3
  for j=i+1:4
  for k=5:-1:i      
 A1(j,k)=A1(j,k)-A1(i,k)*A1(j,i)/A1(i,i);     
      
  end            
  end           
end

for i=4:-1:2
for j=i-1:-1:1
 for k=1:1:5
  A1(j,k)=A1(j,k)-A1(i,k)*A1(j,i)/A1(i,i)  ;
     
 end
    
end       
end
disp('解为')
for i=1:4
    disp(A1(i,5)/A1(i,i))
end


















