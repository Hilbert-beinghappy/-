function [x0,k,res] = newton_sp(x0,f,eps)
% x0=single(x0);
    k=0;
	syms x;
	f_dev=diff(f(x));
%
x=zeros(1,1);
x(1)=x0;
i=1;
%
	c2=double(subs(f_dev,x0));
	while(k<40)
		c1=f(x(i));
        c2=double(subs(f_dev,x(i)));
		if(c1&&c2)
			x(i+1)=x(i)-c1/c2;
           % x(i+1)=roundn(x(i)-c1/c2,-10);
			k=k+1;
			res=abs(x(i+1)-x(i));
			if(res<eps)
				break;
			end
% 			x0=x1;
			i=i+1;
		elseif(c1==0)
% 			x0;
		%	x(i);
			break;
		end
	end
% x0,k
x,k
end

%{
f=@(x)x^3-3*x+1;
newton_sp(0.5,f,1e-8);
%}

% 181800331 ÎÌ¶÷»Û