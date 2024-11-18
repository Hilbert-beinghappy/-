import matplotlib.pyplot as plt
import numpy as np

# 示例数据
diseases = ['BPH', 'Bladder cancer', 'Kidney cancer', 'Urolithiasis', 'Prostate cancer']
regions = ['High-income North America', 'Southern Latin America', 'Western Europe', 'Caribbean', 'South Asia', 
           'Andean Latin America', 'North Africa and Middle East', 'Southern Sub-Saharan Africa', 
           'Central Latin America', 'Oceania', 'High-income Asia Pacific', 'Western Sub-Saharan Africa', 
           'Eastern Europe', 'East Asia', 'Central Asia', 'High-income North America', 'Central Sub-Saharan Africa', 
           'Eastern Sub-Saharan Africa', 'Western Europe', 'Eastern European', 'High-income Asia Pacific', 
           'Southeast Asia', 'East Asia', 'Central Europe', 'Southern Latin America', 'Australia']

eapc_values = np.random.uniform(-1, 2, (5, len(regions)))  # 随机生成数据

# 创建图表
fig, axs = plt.subplots(3, 2, figsize=(12, 18))  # 3行2列的子图

for i, ax in enumerate(axs.flat):
    ax.barh(regions, eapc_values[i], color='skyblue')
    ax.set_title(diseases[i])
    ax.set_xlabel('EAPC')
    ax.invert_yaxis()  # 反转y轴，使得第一个区域在上方
    ax.set_xlim(-1, 2)  # 设置x轴的范围

# 调整子图之间的间距
plt.tight_layout()

# 显示图表
plt.show()