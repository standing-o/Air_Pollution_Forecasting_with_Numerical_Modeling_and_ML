clear; clc; close all;

location=load('lat,lon.txt');
z=location(:,2);
location(:,2)=location(:,3);
location(:,3)=z;

location(:,2)=100*(location(:,2)-min(location(:,2)))/(max(location(:,2))-min(location(:,2)))+1;
location(:,3)=100*(location(:,3)-min(location(:,3)))/(max(location(:,3))-min(location(:,3)))+1;

plot(location(:,2),location(:,3),'o')


h=0.01; D=0.001; dt=0.01;
x=0-0.5*1:1:100+0.5*1; y=0-0.5*1:1:100+0.5*1;

n=size(x',1); c=30*ones(n); cxy=30*ones(n); u=zeros(n); v=zeros(n);
cc=zeros(n);



p=load('p_Hour_4.txt');

for ik=1:20
    for it=1:92
        if p(ik,1)==location(it,1)
            c(fix(location(it,2)),fix(location(it,3)))=p(ik,2);           
        end            
    end        
end 
figure
mesh(c')

for ix=1:1
   
    vector=load('Hour_1.txt');
    for ik=1:92
        a=fix(location(ik,2)+1);
        b=fix(location(ik,3)+1);
        u(a,b)=vector(ik,3);
        v(a,b)=vector(ik,2);  
    end
    [yy xx]=meshgrid(x,y);
    figure
    quiver(xx,yy,u,v,0);  
%     return;
    figure
    
    
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
        
        mesh(x,y,c');
        axis([0 100 0 100 0 100])
        drawnow;
        
    end  
end
