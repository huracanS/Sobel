import os
import numpy as np
import matplotlib.pyplot as plt

# 设置图像尺寸
width, height = 1920, 1078 

# # 获取环境变量PRJBASE的值
# home_directory = os.getenv('PRJBASE')
# if not home_directory:
#     print("Error: The PRJBASE environment variable is not set.")
#     exit(1)

# # 构建完整的文件路径
# file_path = os.path.join(home_directory, 'verif/demosaic/demosaiced_image_1920x1080.bin')

#file_path = "Comb_Result.bin"
file_path = "rtl_image.bin"
#file_path = "gamma_capped_image_py.bin" #过曝光亮度调整
# 读取bin文件
with open(file_path, 'rb') as file:  # model生成的去马赛克文件 1920 X 1080
    # 读取文件内容到一个numpy数组，假设数据是连续的RGB格式
    image_data = np.fromfile(file, dtype=np.uint8)
    # 重塑数组到正确的尺寸 (height, width, 3)
    rgb_image = image_data.reshape((height, width, 3))

# 使用matplotlib显示图像
plt.imshow(rgb_image)
plt.axis('off')  # 不显示坐标轴
plt.show()


