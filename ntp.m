function shr= ntp(x)
     n=length(x);
     shr=0;
     for i=2:n-1
         if(x(i)>x(i-1) && x(i)>x(i+1))
             shr=shr+1;
         elseif(x(i)<x(i-1) && x(i)<x(i+1))
             shr=shr+1;
         else
             continue;
         end
     end
end
