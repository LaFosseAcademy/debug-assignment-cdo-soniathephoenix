FROM node:16
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm install
COPY . /app
ENV PORT=3000
ENV DB_USER=postgres
ENV DB_HOST=tour-de-france-db
ENV DB_NAME=cyclists
ENV DB_PASSWORD=docker
ENV DB_PORT=5432
EXPOSE 3000
ENTRYPOINT  ["node", "index.js"]