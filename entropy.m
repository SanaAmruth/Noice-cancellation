function [y] = entropy(x)
    for i=1:length(x)
        x(i)=abs(x(i));
    end
    x=x.*log(x);
    y=-sum(x);
end