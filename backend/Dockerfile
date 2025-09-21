# ---- Build stage ----
FROM node:20-alpine AS builder
WORKDIR /app

# Cài gói cần cho native module
RUN apk add --no-cache python3 make g++

# Cài deps
COPY package*.json ./
RUN npm ci --omit=dev

# Copy source và build
COPY . .
RUN npm run build

# ---- Runtime ----
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=3000

# Cài curl để healthcheck (tùy chọn)
RUN apk add --no-cache curl

# Chỉ cài deps production, cài mới để compile bcrypt cho Alpine
COPY package*.json ./
RUN npm ci --omit=dev

# Copy dist sau khi build
COPY --from=builder /app/dist ./dist

EXPOSE 3000
CMD ["node","dist/main.js"]
