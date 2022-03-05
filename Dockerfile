FROM golang:1.17.7-buster

RUN mkdir -p /app/bin
COPY ./cmd /app/cmd
COPY ./bench /app/bench
COPY ./go.mod /app
COPY ./go.sum /app
COPY ./Makefile /app
WORKDIR /app
RUN make

ENTRYPOINT ["/app/bin/benchmarker"]
