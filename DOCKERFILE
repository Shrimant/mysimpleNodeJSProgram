FROM node:16.16.0
WORKDIR /app
COPY . /app
CMD ["node", "app.js"]
EXPOSE 3000
