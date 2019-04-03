# Build
# docker build . -t retgits/jfrog-cli:1.24.3-alpine

FROM golang:alpine as builder

RUN apk add --no-cache curl wget git alpine-sdk \
    && cd ~ \
    && git clone https://github.com/jfrog/jfrog-cli-go \
    && cd jfrog-cli-go \
    && go get ./... \
    && cd jfrog-cli/jfrog \
    && CGO_ENABLED=0 go build

FROM alpine:3.9
COPY --from=builder /root/jfrog-cli-go/jfrog-cli/jfrog/jfrog /bin
RUN apk add --no-cache curl wget git ca-certificates