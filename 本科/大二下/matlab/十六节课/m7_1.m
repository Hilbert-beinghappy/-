x0=[1050 1100 1120 1250 1280];
x0=x0(:);
pd=fitdist(x0,'Normal')
ci=paramci(pd,'Alpha',0.1)
[mu,s,muci,sci]=normfit(x0,0.1)