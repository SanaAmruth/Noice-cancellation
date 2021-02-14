function [mean,var,skew,kurto]=stat(x)
    mean=0;
    var=0;
    skew=0;
    kurto=0;
    n=length(x);
    for i=1:n
        mean=mean+x(i);
    end
    mean=mean/n;
    for i=1:n
        var=var+(mean-x(i)*(mean-x(i)));
        skew=skew+(mean-x(i)*(mean-x(i))*(mean-x(i)));
        kurto=kurto+(mean-x(i)*(mean-x(i))*(mean-x(i))*(mean-x(i)));
    end
    var=var/n;
    skew=skew/n;
    kurto=kurto/n;
end
