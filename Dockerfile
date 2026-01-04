FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production
RUN npm install express

COPY . .

EXPOSE 3000

CMD ["node", "server.js"]