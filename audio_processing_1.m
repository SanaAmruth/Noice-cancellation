
[y,Fs]=audioread("male1.wav");
y=y(:,1);
wd=Fs*0.03;
shift=Fs*0.01;
y=y';
y=(y-mean(y))./max(y);
%plot(1:length(y),y);  
mag=[];
ener=[];
acr_max=[];
decay_block=[];
zcr=[];
ACF1=[];
ACF2=[];
ACF3=[];
Peak_loc=[];
first_zcp=[];
sament=[];
block_ntp=[];
% %plot(1:length(y),y);  
i=1;
while(i<length(y))
    if(i+wd>length(y))
        break;
    else
        mag=[mag [shrt_mag(y(i:i+wd))]];
        ener=[ener [shrt_ener(y(i:i+wd))]];
        [mx, decay, first_zero, peak_loc, AC1, AC2, AC3]=local_max(y(i:i+wd));
        Peak_loc=[Peak_loc peak_loc];
        ACF1=[ACF1 AC1];
        ACF2=[ACF2 AC2];
        ACF3=[ACF3 AC3];
        block_ntp=[block_ntp ntp(y(i:i+wd))];
        sament=[sament entropy(y(i:i+wd))];
        first_zcp=[first_zcp first_zero];
        acr_max=[acr_max [mx]];
        decay_block=[decay_block decay];
        zcr=[zcr shrt_zcr(y(i:i+wd))];
    end
    i=i+shift;
end

a=1:441882;
b=1:1000;
g=y(a);
subplot(4,2,1)
plot(1:length(a),y(a));
title("Original audio");
ylabel("Amplitude");
axis tight;

y_mag=[];
for i=b
    if(mag(i)>0.025)
        y_mag=[y_mag 1];
    else
        y_mag=[y_mag 0];
    end
end

% subplot(4,2,2)
% plot(1:length(a),y(a));
% title("Original audio");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(4,2,3);
% plot(1:length(b),mag(b));
% title("Short Term Magnitude");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(4,2,4)
% plot(1:length(y_mag),y_mag);
% title("Speech or not");
% ylabel("Amplitude");
% axis tight;

y_ener=[];
for i=b
    if(ener(i)>0.002)
        y_ener=[y_ener 1];
    else
        y_ener=[y_ener 0];
    end
end

% subplot(4,2,5);
% plot(1:length(b),ener(b));
% title("Short Term Energy");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(4,2,6);
% plot(1:length(b),y_ener);
% title("speech or not Short Term Energy");
% ylabel("Amplitude");
% axis tight;

y_zcr=[];
for i=b
    if(zcr(i)>=24 || zcr(i)<=3.6)
        y_zcr=[y_zcr 0];

    else
        y_zcr=[y_zcr 1];
    end
end

% subplot(4,2,7);
% plot(1:length(b),zcr(b));
% title("Short Term zero crossing rate");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(4,2,8);
% plot(1:length(y_zcr),y_zcr);
% title("speech or not");
% ylabel("Amplitude");
% axis tight;
% 
% a=168022:223146;  %sample number
% b=382:504;        %block number
% 
% c=zeros(1,55130);
% 
% for i=b
%     if(y_mag(i-381)==1)
%         for j=(i-1)*0.01*Fs+1:(i-1)*0.01*Fs+0.03*Fs
%                 c(j-168021)=1;
%         end
%     end
% end
a1=1:441882;
b1=1:1000;
c=zeros(1,441882);
for i=b1
    if(y_mag(i)==1)
        for j=(((i-1)*441)+1):((i-1)*441+1323)
            c(j)=1;
        end
    end
end
m1=c.*g;
c1=zeros(1,441882);
for i=b1
    if(y_ener(i)==1)
        for j=(((i-1)*441)+1):((i-1)*441+1323)
            c1(j)=1;
        end
    end
end
            
m2=c1.*g;

c2=zeros(1,441882);
for i=b1
    if(y_zcr(i)==1)
        for j=(((i-1)*441)+1):((i-1)*441+1323)
            c2(j)=1;
        end
    end
end
            
m3=c2.*g;

           
subplot(4,1,1)
plot(1:length(a),g);
title("Original audio");
ylabel("Amplitude");
axis tight;

subplot(4,1,2)
plot(1:length(m1),m1);
title("Noice removed using magnitude feature");
ylabel("Amplitude");
axis tight;

subplot(4,1,3)
plot(1:length(m2),m2);
title("Noice removed using energy feature");
ylabel("Amplitude");
axis tight;

subplot(4,1,4)
plot(1:length(m3),m3);
title("Noice removed using zero crossing feature");
ylabel("Amplitude");
axis tight;
% subplot(5,2,1)
% plot(1:length(y),y);
% title("Original audio");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,2);
% plot(1:length(mag),mag);
% title("Short Term Magnitude");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,3);
% plot(1:length(ener),ener);
% title("Short Term Energy");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,4);
% plot(1:length(acr_max),acr_max);
% title("Autocorrelation local max");
% ylabel("Local max autocorrelation after energy");
% axis tight;
% 
% subplot(5,2,5);
% plot(1:length(zcr),zcr);
% title("Zero Crossing rate");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,6);
% plot(1:length(sament),sament);
% title("Entropy");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,7)
% plot(1:length(decay_block),decay_block);
% title("Decay Rate");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,8);
% plot(1:length(ACF1),ACF1);
% title("ACF1");
% xlabel("time");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,9);
% plot(1:length(ACF2),ACF2);
% title("ACF2");
% xlabel("time");
% ylabel("Amplitude");
% axis tight;
% 
% subplot(5,2,10);
% plot(1:length(ACF3),ACF3);
% title("ACF3");
% xlabel("time");
% ylabel("Amplitude");
% axis tight;
