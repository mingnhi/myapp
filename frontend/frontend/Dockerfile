# ---------- Build Stage ----------
FROM ghcr.io/cirruslabs/flutter:latest AS build
# hoặc luôn dùng bản mới nhất:
# FROM ghcr.io/cirruslabs/flutter:latest

WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web
