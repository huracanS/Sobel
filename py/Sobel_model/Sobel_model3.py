import cv2
from PIL import Image
import numpy as np

def sobel_edge_detection(image_path):
    # 加载图片并转换为灰度
    image = Image.open(image_path).convert('L')
    image_gray = np.array(image, dtype=np.uint8)  # 确保是8位灰度图像

    # 应用Sobel算子
    sobel_x = cv2.Sobel(image_gray, cv2.CV_64F, 1, 0, ksize=3)
    sobel_y = cv2.Sobel(image_gray, cv2.CV_64F, 0, 1, ksize=3)

    # 计算边缘强度
    edges = cv2.magnitude(sobel_x, sobel_y)

    # 归一化边缘图到0-255
    edges = cv2.normalize(edges, None, 0, 255, cv2.NORM_MINMAX)

    # 转换为8位图像
    edges = np.uint8(edges)

    # 将结果转换回图像
    edges_image = Image.fromarray(edges)

    # 显示图像
    edges_image.show()

    # 保存结果
    edges_image.save("edges_detected.png")

# 调用函数
# sobel_edge_detection('demo.png')
sobel_edge_detection('picture_for_test0.png')
