import cv2
from PIL import Image
import numpy as np

def sobel_edge_detection(image_path, threshold=7):
    # 加载图片并转换为灰度
    image = Image.open(image_path).convert('L')
    image_gray = np.array(image, dtype=np.uint8)

    # 应用Sobel算子
    sobel_x = cv2.Sobel(image_gray, cv2.CV_64F, 1, 0, ksize=3)
    sobel_y = cv2.Sobel(image_gray, cv2.CV_64F, 0, 1, ksize=3)

    # 计算边缘强度
    edges = cv2.magnitude(sobel_x, sobel_y)

    # 归一化边缘图到0-255
    edges = cv2.normalize(edges, None, 0, 255, cv2.NORM_MINMAX)

    # 应用阈值，得到二值图像
    _, binary_edges = cv2.threshold(edges, threshold, 255, cv2.THRESH_BINARY)

    # 反转二值图像，使得边缘为黑色，其余为白色
    inverted_edges = 255 - binary_edges

    # 将结果转换回图像
    inverted_edges_image = Image.fromarray(inverted_edges.astype(np.uint8))

    # 显示图像
    inverted_edges_image.show()

    # 保存结果
    inverted_edges_image.save("inverted_edges_detected.png")

# 调用函数
sobel_edge_detection('picture_for_test0.png')
# sobel_edge_detection('demo.png')