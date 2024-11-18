alpha=0.05
edges=[14:0.4:16];
x=[14.2:0.4:15.8]
mi=[3 8 19 12 8]
pd=makedist('Normal','mu',15.078,'sigma',0.4325)
[h,p,st]=chi2gof(x,'cdf',pd,'Edges',edges,'Frequency',mi)
k2=chi2inv(1-alpha,st.df)