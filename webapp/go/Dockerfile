FROM golang:1.17.7-buster
COPY . /app
WORKDIR /app
RUN go build -o isucari
ENTRYPOINT ["/app/isucari"]
