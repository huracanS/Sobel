import numpy as np
import matplotlib.pyplot as plt

def plot_color_image_from_bin(bin_file_path, width, height):
    # 读取 bin 文件中的数据
    with open(bin_file_path, 'rb') as f:
        data = np.fromfile(f, dtype=np.uint8)
    
    # 由于是 RGB 图像，每个像素占用 3 个字节，因此数据量应该是宽度的三倍乘以高度
    if len(data) != 3 * width * height:
        print(len(data))
        raise ValueError("数据大小与图像尺寸不匹配")

    # 将数据重塑为 3D 数组，对应于 RGB 三个通道
    image = data.reshape((height, width, 3))
    
    # 使用 matplotlib 显示彩色图像
    plt.imshow(image)
    plt.axis('off')  # 隐藏坐标轴
    plt.show()

# 使用函数
bin_file_path = '../../verif/sobel_test/sobel_o_rgb.bin'  # 替换为你的 bin 文件路径
width = 1920
height = 1080
plot_color_image_from_bin(bin_file_path, width, height)
