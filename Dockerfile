FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends 
    chromium 
    ca-certificates 
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
COPY . .

RUN npm ci

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0

EXPOSE 3000

CMD ["node", "dist/index.js"]
