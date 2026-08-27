FROM alpine:latest

# نصب بسته‌های ضروری و ابزار دانلود
RUN apk add --no-cache curl unzip

# دانلود آخرین نسخه هسته Xray از گیت‌هاب
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /usr/local/bin/ && \
    rm /tmp/xray.zip

# انتقال فایل کانفیگ به مسیر اجرایی
COPY config.json /etc/xray/config.json

# باز کردن پورت پیش‌فرض (ریلوی پورت رو به صورت متغیر میده که پایین تنظیمش می‌کنیم)
EXPOSE 8080

# دستور اجرای Xray هنگام روشن شدن سرور
CMD ["xray", "-config", "/etc/xray/config.json"]
