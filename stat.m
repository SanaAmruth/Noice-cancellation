function [mean,var,skew,kurto]=stat(x)
    mean=0;
    var=0;
    skew=0;
    mu3=0;
    mu4=0;
    kurto=0;
    n=length(x);
    for i=1:n
        mean=mean+x(i);
    end
    mean=mean/n;
    for i=1:n
        var=var+(mean-x(i)*(mean-x(i)));
        mu3=mu3+(mean-x(i)*(mean-x(i))*(mean-x(i)));
        mu4=mu4+(mean-x(i)*(mean-x(i))*(mean-x(i))*(mean-x(i)));
    end
    var=var/n;
    mu3=m3/n;
    mu4=mu4/n;
    skew=(mu3*mu3)/(var*var);
    kurto=mu4/var;
end