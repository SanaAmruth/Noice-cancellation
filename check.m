% [x,Fs]=audioread("janu1_norm.wav");
% x=x(:,1);
% x=x';
[y,Fs]=audioread("janu1.wav");

% sound(y,Fs);
% %
y=y(:,1);
wd=Fs*0.03;
shift=Fs*0.01;
mx=[];
decay=[];
y=y';
i=0;
cr=[];
total=0;
d=0;
y=(y-mean(y))./max(y);
y=y(1:wd);

for i=1:length(y)
        cr=[cr auto_cr(y,i-1)];
        total=total+cr(i);
end
sum=0;
k=first_zcr(cr);

k
for i=k:length(cr)
    if((cr(i+1)<cr(i) && cr(i-1)<cr(i)) && cr(i)>0)
        mx=cr(i);
        u=i;
        d=1;
        break;
    end
end
u
for i=1:u
    sum=sum+cr(i);
end
decay=sum/total;
plot(1:length(cr),cr);
total
% while(i<length(y))
%     if(i+wd>length(y))
%         break;
%     else
%         [u v]=local_max(y(i:i+wd));
%         mx=[mx u];
%         decay=[decay v];
%     end
%     i=i+shift;
% end
% subplot(3,1,1);
% plot(1:length(mx),mx);
% subplot(3,1,2);
% plot(1:length(decay),decay);

%auto_cr(x(1:0.03*Fs),1,Fs);
% sound(y10,Fs10);
% [y11,Fs11]=audioread("janu1_norm.wav");
% sound(y11,Fs11);