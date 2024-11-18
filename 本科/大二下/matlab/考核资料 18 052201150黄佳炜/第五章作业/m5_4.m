clear,clc
p=[36.9,46.7,63.7,77.8,84.0,87.5]';
T=[181,197,235,270,283,292]';
pb=mean(p);
Tb=mean(T);
ah=sum((T-Tb).*(p-pb))/sum((p-pb).^2) %求a的估计值
bh=Tb-ah*pb %求b的估计值
