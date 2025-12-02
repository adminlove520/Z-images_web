# 使用国内镜像源
FROM docker.m.daocloud.io/library/python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制依赖文件并安装（使用国内pip源）
COPY requirements.txt .
RUN pip install --no-cache-dir -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt

# 复制应用代码
COPY app.py .

# 暴露 Streamlit 默认端口
EXPOSE 8501

# 启动命令
CMD ["streamlit", "run", "app.py", "--server.address=0.0.0.0"]