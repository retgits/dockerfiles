# Build
# docker build . -t retgits/jfrog-cli:1.26.0

FROM golang:alpine as builder

RUN apk add --no-cache curl wget git alpine-sdk \
    && cd ~ \
    && git clone https://github.com/jfrog/jfrog-cli-go \
    && cd jfrog-cli-go \
    && go get ./... \
    && CGO_ENABLED=0 go build -o jfrog

FROM golang:alpine
COPY --from=builder /root/jfrog-cli-go/jfrog /bin
RUN apk add --no-cache curl wget git ca-certificates