# Build
# docker build . -t retgits/goc:1.0.3-1

FROM golang:alpine as builder

RUN apk add --no-cache curl wget git alpine-sdk \
    && cd ~ \
    && git clone https://github.com/jfrog/goc \
    && cd goc \
    && go get ./... \
    && CGO_ENABLED=0 go build

FROM golang:alpine
COPY --from=builder /root/goc/goc /bin
RUN apk add --no-cache curl wget git ca-certificates