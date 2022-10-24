FROM golang:1.19

RUN mkdir /app
WORKDIR /app

COPY . .
COPY main_test.go .

# Fetch dependencies
COPY go.mod .
COPY go.sum .

RUN go mod tidy
RUN go test -v
RUN go run main.go