FROM golang:1.11.4 AS builder

COPY . /go/src/github.com/niima/gohc

WORKDIR /go/src/github.com/niima/gohc

RUN go get -v

RUN CGO_ENABLED=0  go build -v -o /go/bin/app

FROM alpine:3.7 AS app

EXPOSE 8080

RUN apk update && apk add ca-certificates

COPY --from=builder /go/bin/app /

RUN chmod +x /app

ENTRYPOINT /app
