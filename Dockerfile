FROM python:3.12-slim

# تنظیم متغیرهای محیطی
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# نصب پیش‌نیازهای سیستمی
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && apt-get clean

# تنظیم دایرکتوری کاری
WORKDIR /code

# کپی کردن فایل‌های وابستگی
COPY requirements.txt /code/

# نصب وابستگی‌های Python
RUN pip install --no-cache-dir -r requirements.txt

# کپی کردن باقی فایل‌ها
COPY . /code/
