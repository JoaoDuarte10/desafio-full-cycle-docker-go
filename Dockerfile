FROM golang:1.19-alpine AS builder

WORKDIR /usr/src/app

COPY go.mod ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o /build/desafio-full-cycle-docker-go

FROM scratch

WORKDIR /app

COPY --from=builder /build .

CMD [ "./desafio-full-cycle-docker-go" ]