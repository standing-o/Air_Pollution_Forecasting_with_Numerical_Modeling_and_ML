clear; clc; close all;

% x, y ê°? 
x=load('Latitude.txt');
y=load('Longitude.txt');

map = imread('map.jpg');

x=x*133330; y=y*133330;
% ê¸°ë³¸ ê°’ë“¤ ?„£ê¸?


% make D size(1,23);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D=zeros(1,23);
for ik=1:5
    D(ik)=100;
end
for ik=6:10
    D(ik)=250;
end
for ik=11:15
    D(ik)=500;
end
for ik=20:23
    D(ik)=1000;
end
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


title_D=sprintf('z_D');
csvwrite(title_D,D);  

h=x(1,3)-x(1,2);%dt=0.1*h^2;
dt=0.001*((h^2/(max(max(x))-min(min(x)))));
n=size(x,1); pxy=zeros(n);
% return
aa=load('z_Hour_23_made');



return
        imwrite(imind,cm,filename,'gif','Loopcount',10);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append')
end
return
% ë¯¸ì„¸ë¨¼ì? ?°?´?„°
pol=load('Hour_1_inter_p.txt');

% ?…¸?´ë§? ê²½ê³„ ì¡°ê±´
pol(1,:)=pol(2,:); pol(n,:)=pol(n-1,:);
pol(:,1)=pol(:,2); pol(:,n)=pol(:,n-1);

mesh(y,x,pol)
axis([y(1,1) y(100,100) x(1,1) x(100,100) 0 80])

[imind cm]=rgb2ind(img,256);
title('Air Polution')
error=zeros(23,1);

filename='mesh.gif';

% return;
for ik=1:23
    
    u=load(sprintf('Hour_%1.1d_inter_u.txt',ik));
    u=u*0.1;
    v=load(sprintf('Hour_%1.1d_inter_v.txt',ik));
    v=v*0.1;
%     figure;
%     quiver(x,y,u,v)
    
    for it=1:fix(1*60*60/dt)
        
        
        if (mod(it,5000)==0)
            fprintf('%-3d%d\n',ik,it);
        end
    
        pol(1,:)=pol(2,:); pol(n,:)=pol(n-1,:);
        pol(:,1)=pol(:,2); pol(:,n)=pol(:,n-1);
        
        for iu=2:n-1
            for iv=2:n-1
                uc=pol(iu+1,iv)*u(iu+1,iv)-pol(iu-1,iv)*u(iu-1,iv);
                vc=pol(iu,iv+1)*v(iu,iv+1)-pol(iu,iv-1)*v(iu,iv-1);
                p_2=pol(iu+1,iv)+pol(iu-1,iv)-4.0*pol(iu,iv)+pol(iu,iv+1)+pol(iu,iv-1);
                fake=pol(iu,iv)-dt*(uc+vc)/(2*h)+D(ik)*dt*p_2/(h^2);
                if fake>120
                    pxy(iu,iv)=120;
                else    
                pxy(iu,iv)=fake;
                end
            end    
        end 
        
        pol=pxy;
        if (mod(it,10000)==0)
        mesh(y,x,pol);
%         title(ik);
        colorbar;
        ylabel('Longitude');
        xlabel('Latitude');
        axis([y(1,1) y(100,100) x(1,1) x(100,100) 0 130])
        
        drawnow;
        end

  
    end
    frame=getframe(1);
    img=frame2im(frame);
    [imind cm]=rgb2ind(img,256);
    
    
    
    if ik == 1
        imwrite(imind,cm,filename,'gif','Loopcount',10);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append')
    end
    pause(0.1)       
    title=sprintf('z_Hour_%2.2d_made',ik);
    csvwrite(title,pol);   
    k=load(sprintf('Hour_%1.1d_inter_p.txt',ik+1));
    error(ik)=(sum(sum((pol-k).^2))/10000)^(1/2);
end
title_error=sprintf('z_error');
csvwrite(title_error,error);   
error


