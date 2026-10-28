FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends chromium ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

EXPOSE 3000

CMD ["node", "dist/index.js"]
