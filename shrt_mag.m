function shr= shrt_mag(x)
     n=length(x);
     shr=0;
     for i=1:n
         shr=shr+abs(x(i));
     end
     shr=shr/length(x);
end

