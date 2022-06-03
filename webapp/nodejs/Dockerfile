FROM node:12.22
RUN apt-get update \
 && apt-get install -y \
    mariadb-client \
    locales locales-all
RUN locale-gen ja_JP.UTF-8
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
ENTRYPOINT ["npm"]
CMD ["start"]
