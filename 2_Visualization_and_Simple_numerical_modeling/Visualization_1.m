clear; clc; close all;

location=load('lat,lon.txt');
vector=load('Hour_1.txt');
n=102;
display=zeros(n); u=zeros(n); v=zeros(n); a=0; b=0;
h=1; D=0.001; dt=0.1*h^2;
c=zeros(n); cxy=zeros(n);
x=1-1:1:100+1; y=1-1:1:100+1;

return;

for ik=1:92
    a=location(ik,2)+1;
    b=location(ik,3)+1;
    display(a+1,b+1)=1;
    u(a+1,b+1)=vector(ik,2);
    v(a+1,b+1)=vector(ik,3);
    
end

[yy xx]=meshgrid(x,y);
mesh(xx,-yy,display)
figure
quiver(xx,-yy,u,v)
figure
mesh(c)

return;
for ik=1:100
    ik
    c(1,:)=c(2,:); c(n,:)=c(n-1,:);
    c(:,1)=c(:,2); c(:,n)=c(:,n-1);
    
    for iu=2:n-1
        for it=2:n-1
            uc=c(iu+1,it)*u(iu+1,it)-c(iu-1,it)*u(iu-1,it);
            vc=c(iu,it+1)*v(iu,it+1)-c(iu,it-1)*v(iu,it-1);
            c_2=c(iu+1,it)+c(iu-1,it)-4.0*c(iu,it)+c(iu,it+1)+c(iu,it-1);
            cxy(iu,it)=c(iu,it)-dt*(uc+vc)/(2*h)+D*dt*c_2/(h^2);    
        end    
    end   
    
    c=cxy;
    
    if (mod(ik,10000) == 0 || ik==1)
        figure
        mesh(x(2:n-1),y(2:n-1),c(2:n-1,2:n-1)');
        axis([0 1 0 1 -0.1 1])
        drawnow;
    end
    
    
end    