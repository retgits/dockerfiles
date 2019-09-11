FROM retgits/jfrog-cli:1.26.0

LABEL "name"="jfrog-cli"
LABEL "maintainer"="retgits"
LABEL "version"="0.4.0"

LABEL "com.github.actions.name"="JFrog CLI for GitHub Actions"
LABEL "com.github.actions.description"="Runs a JFrog CLI Command"
LABEL "com.github.actions.icon"="compass"
LABEL "com.github.actions.color"="green"

COPY README.md entrypoint.sh /
RUN chmod +x /entrypoint.sh && \
    mv /entrypoint.sh /bin

ENV JFROG_CLI_OFFER_CONFIG=false

ENTRYPOINT ["entrypoint.sh"]