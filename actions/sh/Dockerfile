FROM alpine:3.9

LABEL "name"="sh"
LABEL "maintainer"="retgits"
LABEL "version"="0.2.1"

LABEL "com.github.actions.name"="Shell for GitHub Actions"
LABEL "com.github.actions.description"="Runs one or more commands in an Action"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"

COPY README.md entrypoint.sh /

RUN apk add --no-cache wget curl jq git ca-certificates && \
    chmod +x /entrypoint.sh &&\
    mv /entrypoint.sh /bin

ENTRYPOINT ["entrypoint.sh"]
