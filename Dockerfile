# ---------- Stage 1: Build & Test ----------
FROM node:23-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

# Run tests here (CI safety)
RUN npm test

# Remove devDependencies AFTER tests
RUN npm prune --omit=dev

# ---------- Stage 2: Production Runtime ----------
FROM node:23-alpine

WORKDIR /app

# Copy only production dependencies from builder
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/src ./src
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000

CMD ["node", "src/index.js"]
