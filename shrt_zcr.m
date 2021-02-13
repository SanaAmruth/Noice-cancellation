function z=zcr(x)
    n=length(x);
    z=0;
    
    for i=2:n-1
        if(x(i)==0)
            if((x(i-1)*x(i+1))<0)
                z=z+1;
        else
            if((x(i)*x(i-1))<0)
                z=z+1;
            end
        end
    end
    z=(z+(x(i)*x(i+1)<0));
end
% function [y]=zcr(a)
% u=0;
% p=0;
% c=0;
% for l=1:length(a)
%     if(a(l)>0)
%         u=1;
%         if(p==1)
%             c=c+1;
%         end
%         p=0;
%     elseif(a(l)<0)
%         if(u~=1)
%             p=1;
%         else
%             if(p==0)
%                 c=c+1;
%             end
%         end
%         p=1;
%     end
% end
% y=c;
% end
% function answer=str_zcr(x)
