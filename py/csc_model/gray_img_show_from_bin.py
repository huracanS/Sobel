import numpy as np
import matplotlib.pyplot as plt

def plot_grayscale_image_from_bin(bin_file_path, width, height):
    # 读取 bin 文件中的数据
    with open(bin_file_path, 'rb') as f:
        data = np.fromfile(f, dtype=np.uint8)
    
    # 确保数据的长度与期望的图像大小一致
    if len(data) != width * height:
        print(len(data))
        raise ValueError("数据大小与图像尺寸不匹配")


    # 将数据重塑为 2D 数组
    image = data.reshape((height, width))
    
    # 使用 matplotlib 显示灰度图像
    plt.imshow(image, cmap='gray')
    plt.axis('off')  # 隐藏坐标轴
    plt.show()

# 使用函数
# bin_file_path = '../../verif/csc_test/img_o_gray.bin'  # 替换为你的 bin 文件路径
# bin_file_path = '../../verif/sobel_ctrl_test/sobel_ctrl_o.bin'  # 替换为你的 bin 文件路径
bin_file_path = '../../verif/sobel_test/sobel_o.bin'  # 替换为你的 bin 文件路径
width = 1920
height = 1080
plot_grayscale_image_from_bin(bin_file_path, width, height)
