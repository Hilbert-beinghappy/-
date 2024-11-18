vectcor1=[1 2 3];
vectorSize1=size(vectcor1,2);
verctor2=[1 2 3 4 5];
vectorSize2=size(verctor2,2);
if vectorSize1>vectorSize2
    i=0;
    while i<vectorSize1-vectorSize2
        verctor2=[0 verctor2];
        i=i+1;
    end
end
if vectorSize1<vectorSize2
    i=0;
    while i<vectorSize2-vectorSize1
        vectcor1=[0 vectcor1];
        i=i+1;
    end
end
disp(vectcor1);
disp(verctor2);