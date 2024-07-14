# 边缘检测（Sobel、Laplace、Canny）
import cv2 as cv
 
 
# Sobel一阶微分算子
def Sobel():
    # 1、对X和Y方向求微分
    x = cv.Sobel(img, cv.CV_16S, 1,     0)
    y = cv.Sobel(img, cv.CV_16S, 0,     1)
    #                 深度      x方向阶数 y方向阶数
 
    # 2、取绝对值
    absX = cv.convertScaleAbs(x)  # 转回uint8
    absY = cv.convertScaleAbs(y)
 
    # 3、线性混合
    dst = cv.addWeighted(absX, 0.5, absY, 0.5, 0)
    #                          比例       比例  常数
 
    # 4、显示
    cv.imshow("absX", absX)
    cv.imshow("absY", absY)
    cv.imshow("dst", dst)
 
 
if __name__ == '__main__':
    # 读取图片
    img = cv.imread("demo.png")
    cv.imshow("img", img)
 
    Sobel()         #Sobel一阶微分算子
 
    cv.waitKey(0)