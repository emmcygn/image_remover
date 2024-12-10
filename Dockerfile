FROM python:3.9

WORKDIR /app

# Download the model during build
RUN mkdir -p /home/.u2net && \
    wget https://github.com/danielgatis/rembg/releases/download/v0.0.0/u2net.onnx -O /home/.u2net/u2net.onnx

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5100

CMD ["python", "app.py"]