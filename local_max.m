function [mx,decay,j,peak_loc,AC1,AC2,AC3]=local_max(x)
%     sum=shrt_ener(x);
%     total=shrt_ener(x);
%     for i=1:(length(x)-1)
%         cr=[cr auto_cr(x,i)];
%         total=total+cr(i);
%         if(y==0)
%             sum=sum+cr(i);
%         if(cr(i)==0 && y==0)
%             y=i;
%         end
%     end
    sum=shrt_ener(x);
    d=0;
    total=shrt_ener(x);
    cr=zeros(1,length(x));
    for i=1:length(x)
        cr(i)=auto_cr(x,i);
        total=total+cr(i);
    end
    plot(1:length(cr),cr);
    j=first_zcr(cr);
    for i=j:length(cr)-1
        if(cr(i)>cr(i+1))
            if(cr(i)>cr(i-1))
                if(cr(i)>0)
                    mx=cr(i);
                    peak_loc=i;
                    break;
                end
            end
        end
    end
    cr=[shrt_ener(x) cr];
    j=j+1;
    for i=1:20
        sum=sum+cr(i)*cr(i);
    end
    AC1=cr(2);
    AC2=cr(3);
    AC3=cr(4);
    decay=sum/total;
end
%   plot(1:length(cr),cr);
%     for i=1:(length(x)-1)
%         if(auto_cr(x,i)==0)
%             break;
%         end
%     end
%     i=i+1;
%     while(i<length(x)-1)
%         if(auto_cr(x,i+1)<auto_cr(x,i) && auto_cr(x,i-1)<auto_cr(x,i))
%             break;
%         end
%         i=i+1;
%     end
%     mx=auto_cr(x,i);