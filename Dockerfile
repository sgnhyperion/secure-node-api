# ---------- Stage 1: Build & Test ----------
FROM node:23-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Run tests here (CI safety)
RUN npm test

# ---------- Stage 2: Production Runtime ----------
FROM node:23-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

COPY --from=builder /app/src ./src

EXPOSE 3000

CMD ["node", "src/index.js"]
