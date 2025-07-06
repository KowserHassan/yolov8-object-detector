# FROM python:3.10-slim

# WORKDIR /app/app

# COPY requirements.txt /app/
# RUN pip install --no-cache-dir -r /app/requirements.txt

# COPY . /app/

# EXPOSE 8080
# CMD ["python", "app.py"]

FROM python:3.10-slim

WORKDIR /app

# Install OS dependencies
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    libgl1  \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python", "app.py"]

