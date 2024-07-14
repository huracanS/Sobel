def rgb_to_yuv(r, g, b):
    # 应用YUV转换公式
    y = ((77 * r + 150 * g + 29 * b) >> 8)
    u = (((-43 * r) - (85 * g) + (128 * b) + 32768) >> 8)
    v = (((128 * r) - (107 * g) - (21 * b) + 32768) >> 8)
    
    return y, u, v

# 测试RGB到YUV转换
if __name__ == "__main__":
    # 假设有一个RGB颜色值
    r, g, b = 255, 0, 0  # 红色
    
    # 转换RGB到YUV
    y, u, v = rgb_to_yuv(r, g, b)
    
    # 打印结果
    print(f"RGB({r}, {g}, {b})转换到YUV为(Y:{y}, U:{u}, V:{v})")