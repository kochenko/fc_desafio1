FROM golang:1.16-alpine AS builder
WORKDIR /app
COPY  main.go .
RUN go build main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main /app/main
ENTRYPOINT ["/app/main"]