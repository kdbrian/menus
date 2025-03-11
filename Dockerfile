FROM golang:1.24 AS builder

WORKDIR /app

COPY   go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o menus

FROM alpine:latest
WORKDIR /root

CMD ["ls", "-1"]

RUN apk --no-cache add ca-certificates

COPY --from=builder /app .

EXPOSE 6969

RUN go run menus

