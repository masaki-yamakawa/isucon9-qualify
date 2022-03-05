FROM golang:1.17.7-buster
RUN apt-get update \
 && apt-get install -y \
    mariadb-client
COPY . /app
WORKDIR /app
RUN go build -o isucari
ENTRYPOINT ["/app/isucari"]
