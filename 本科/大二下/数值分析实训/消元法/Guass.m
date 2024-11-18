function x=Guass(A,b)
    %步骤一：初始化and异常值处理
    [n,n2]=size(A);
    n3=length(b);
    if n~=n2||n~=n3
        erro('input wrong')
    end
    x=ones(n,1);
    %步骤二：选择列主元
    for k=1:n-1
        p=k;
        p_max=abs(A(k,k));
        for i=k+1:n
            if p_max<abs(A(i,k));%如果对角线位置的元素小于下面的列元素
                p_max=abs(A(i,k));
                p=i;%记录进行换行的行数
            end
        end
    end
    %步骤三：换行
        if p>k %交换第K行和第P行
            for i=k:n
                t=A(k,i);
                A(k,i)=A(p,i);
                A(p,i)=t;
            end
            t1=b(k);
            b(k)=b(p);
            b(p)=t1;
        end
    %步骤四：矩阵的LU分解
    L=eye(n);
    L(:,1)=A(:,1)/A(1,1);
    U=zeros(n,n2);
    U(1,:)=A(1,:);%初始化LU的首行和首列
        for i=2:n
            for j=2:n
                if i<=j
                    U(i,j)=A(i,j)-sum(L(i,1:i-1).*U(1:i-1,j)');
                else
                    if U(j,j)==0
                        L(i,j)=0;
                    else
                        L(i,j)=(A(i,j)-sum(L(i,1:j-1).*U(1:j-1,j)'))/U(j,j);
                    end
                end
            end
        end
    %利用回代法求解
    Y=L\b;
    x=U\Y;
end