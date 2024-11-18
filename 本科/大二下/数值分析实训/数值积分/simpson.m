function s=simpson(y,h)
    n=length(y);
    if(mod(n-1,2)==0)
        s=y(1)+y(n)+4*sum(y(2:2:n-1))+2*sum(y(3:2:n-2));
        s=s*h/6;
    else 
        disp('½ÚµãÊý´í');
    end
end