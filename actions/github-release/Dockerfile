FROM alpine:3.9

LABEL "name"="release"
LABEL "maintainer"="retgits"
LABEL "version"="0.2.0"

LABEL "com.github.actions.name"="Release for GitHub Actions"
LABEL "com.github.actions.description"="Creates a new release on GitHub"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"

COPY README.md entrypoint.sh /

RUN apk add --no-cache wget curl jq git ca-certificates && \
    chmod +x /entrypoint.sh && \
    mv /entrypoint.sh /bin && \
    wget https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz && \
    tar xvf ghr_v0.12.0_linux_amd64.tar.gz && \
    mv ghr_v0.12.0_linux_amd64/ghr /usr/bin/ && \
    chmod +x /usr/bin/ghr && \
    rm ghr_v0.12.0_linux_amd64.tar.gz && \
    rm -rf ghr_v0.12.0_linux_amd64

ENTRYPOINT ["entrypoint.sh"]