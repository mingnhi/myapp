# ---------- Build Stage ----------
# ---------- Build Stage ----------
FROM ghcr.io/cirruslabs/flutter:latest AS build
WORKDIR /app
COPY . .
RUN flutter pub get
RUN flutter build web

# ---------- Serve Stage ----------
FROM nginx:alpine
COPY --from=build /app/build/web /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

