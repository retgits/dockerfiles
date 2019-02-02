# Build
# docker build . -t retgits/jfrog-cli:1.23.2

FROM golang:alpine as builder

RUN apk add --no-cache curl wget git alpine-sdk \
    && cd ~ \
    && git clone https://github.com/jfrog/jfrog-cli-go \
    && cd jfrog-cli-go \
    && go get ./... \
    && cd jfrog-cli/jfrog \
    && CGO_ENABLED=0 go build

FROM golang:alpine
COPY --from=builder /root/jfrog-cli-go/jfrog-cli/jfrog/jfrog /bin
RUN apk add --no-cache curl wget git ca-certificates