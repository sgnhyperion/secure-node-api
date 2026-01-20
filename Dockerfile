# ---------- Builder (tests & verification only) ----------
FROM node:23-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm test

# ---------- Runtime (production only) ----------
FROM node:23-alpine

WORKDIR /app

# Install ONLY production dependencies
COPY package*.json ./
RUN npm ci --omit=dev

# Copy application code only
COPY src ./src

EXPOSE 3000
CMD ["node", "src/index.js"]
