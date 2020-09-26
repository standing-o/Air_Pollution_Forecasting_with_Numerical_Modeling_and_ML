clear; clc; close all;

location=load('lat,lon.txt');
z=location(:,2);
location(:,2)=location(:,3);
location(:,3)=z;

locmix=min(location(:,2));
locmax=max(location(:,2));
locmiy=min(location(:,3));
locmay=max(location(:,3));


location(:,2)=100*(location(:,2)-locmix)/(locmax-locmix)+1;
location(:,3)=100*(location(:,3)-locmiy)/(locmay-locmiy)+1;

plot(location(:,2),location(:,3),'o')


h=0.01; D=0.001; dt=0.11;
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
mesh(c)