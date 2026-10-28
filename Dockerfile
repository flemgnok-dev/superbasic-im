FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends chromium ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build && echo "=== DIST CONTENTS ===" && ls -la /app/dist && echo "=== INDEX CHECK ===" && test -f /app/dist/index.js

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

EXPOSE 3000

CMD ["sh", "-c", "cd dist && node index.js init && node index.js"]
