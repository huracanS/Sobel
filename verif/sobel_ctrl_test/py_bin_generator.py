def generate_bin_file(width, height, filename):
    with open(filename, 'wb') as f:
        for y in range(height):
            start_value = (y % 255) + 1  # Start value for each row (1 to 255, then wrap)
            row_data = [start_value] * width  # Create a row where each element is start_value
            f.write(bytes(row_data))

if __name__ == '__main__':
    width = 1920
    height = 1080
    filename = 'output.bin'
    generate_bin_file(width, height, filename)
    print(f"Binary file '{filename}' generated successfully.")
