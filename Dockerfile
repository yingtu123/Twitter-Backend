FROM python:3.10-buster

# 环境变量配置
ENV PYTHONUNBUFFERED=1

# 更新 pip
RUN /usr/local/bin/python -m pip install --upgrade pip -i https://mirrors.aliyun.com/pypi/simple

# 创建代码目录
RUN mkdir /code
WORKDIR /code

# 安装依赖
COPY requirements-prd.txt /code/
RUN pip install -i https://mirrors.aliyun.com/pypi/simple -r requirements-prd.txt
COPY . /code/

# 暴露端口
EXPOSE 8000

# 启动命令（示例以 Django 项目为例）
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]