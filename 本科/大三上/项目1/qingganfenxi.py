import matplotlib.pyplot as plt
import numpy as np

# ʾ������
diseases = ['BPH', 'Bladder cancer', 'Kidney cancer', 'Urolithiasis', 'Prostate cancer']
regions = ['High-income North America', 'Southern Latin America', 'Western Europe', 'Caribbean', 'South Asia', 
           'Andean Latin America', 'North Africa and Middle East', 'Southern Sub-Saharan Africa', 
           'Central Latin America', 'Oceania', 'High-income Asia Pacific', 'Western Sub-Saharan Africa', 
           'Eastern Europe', 'East Asia', 'Central Asia', 'High-income North America', 'Central Sub-Saharan Africa', 
           'Eastern Sub-Saharan Africa', 'Western Europe', 'Eastern European', 'High-income Asia Pacific', 
           'Southeast Asia', 'East Asia', 'Central Europe', 'Southern Latin America', 'Australia']

eapc_values = np.random.uniform(-1, 2, (5, len(regions)))  # �����������

# ����ͼ��
fig, axs = plt.subplots(3, 2, figsize=(12, 18))  # 3��2�е���ͼ

for i, ax in enumerate(axs.flat):
    ax.barh(regions, eapc_values[i], color='skyblue')
    ax.set_title(diseases[i])
    ax.set_xlabel('EAPC')
    ax.invert_yaxis()  # ��תy�ᣬʹ�õ�һ���������Ϸ�
    ax.set_xlim(-1, 2)  # ����x��ķ�Χ

# ������ͼ֮��ļ��
plt.tight_layout()

# ��ʾͼ��
plt.show()