FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install --production

COPY drizzle.config.ts ./

ENV HOST=0.0.0.0
ENV PORT=4983

EXPOSE 4983

CMD ["npx", "drizzle-kit", "studio", "--host", "0.0.0.0", "--port", "4983"]

