function y1=transform(y,wd,shift)
%wd-window size=1323;
%shift-window shift for each iteration=441;
    y=y';
    n=length(y);
    y1=[];
    i=1;
    while(i<length(y))
        if(i+wd>length(y))
            break;
        end
        y1=[y1 y(i:i+wd-1)];
        i=i+shift;
    end
end
        
        