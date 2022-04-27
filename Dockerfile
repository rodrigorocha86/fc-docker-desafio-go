FROM golang:1.18.1-alpine3.15 AS build-app

WORKDIR /usr/app/src

COPY . .

RUN go build main.go

FROM alpine:3.15.4

WORKDIR /usr/app/bin

COPY --from=build-app /usr/app/src/main ./

ENTRYPOINT [ "./main" ]