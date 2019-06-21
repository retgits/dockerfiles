# Build
# docker build . -t retgits/jfrog-cli:1.26.0-alpine

FROM golang:alpine as builder

RUN apk add --no-cache curl wget git alpine-sdk \
    && cd ~ \
    && git clone https://github.com/jfrog/jfrog-cli-go \
    && cd jfrog-cli-go \
    && go get ./... \
    && CGO_ENABLED=0 go build -o jfrog

FROM alpine:3.9
COPY --from=builder /root/jfrog-cli-go/jfrog /bin
RUN apk add --no-cache curl wget git ca-certificates