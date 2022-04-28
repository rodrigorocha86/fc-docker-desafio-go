FROM golang:1.18.1-alpine3.15 AS build-app

WORKDIR /usr/app/src

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /usr/app/bin

COPY --from=build-app /usr/app/src/main ./

ENTRYPOINT [ "./main" ]