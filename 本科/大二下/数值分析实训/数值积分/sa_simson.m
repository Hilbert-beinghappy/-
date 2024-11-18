function [s,h,k]=sa_simpson(f,a,b,eps)
    k=1;
    h=b-a;
    s(1)=0;
    x=[a:h/2:b];
    y=f(x);
    s(2)=simpson(y,h);
    while (abs(s(k+1)-s(k))>eps)
        h=h/2;
        x=[a:h/2:b];
        y=f(x);
        s(k+2)=simpson(y,h);
        k=k+1;
    %     if (abs(s(k+1)-s(k))>abs(s(k-1)-s(k)))
    %         break;
    %     end
        if k>20
            break;
        end
    end
    disp(k)