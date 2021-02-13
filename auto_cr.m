function p=auto_cr(x,k)

%     while(z<=length(y))
%         m=sum(abs(x.*y));
%         d=[d m];
%         y=y(1:(length(y)-wd));
%         y=[zeros(wd) y];
%         z=z+shift;
%     end
    y=[zeros(1,k) x(1:(length(x)-k))];
    p=sum(x.*y);
    p=p/length(x);
end