FROM retgits/goc:1.0.3-1

LABEL "name"="gocenter"
LABEL "maintainer"="retgits"
LABEL "version"="0.3.1"

LABEL "com.github.actions.name"="GoCenter for GitHub Actions"
LABEL "com.github.actions.description"="Use GoCenter to get modules"
LABEL "com.github.actions.icon"="settings"
LABEL "com.github.actions.color"="green"

COPY README.md entrypoint.sh /

RUN chmod +x /entrypoint.sh \ 
    && mv /entrypoint.sh /bin

ENTRYPOINT ["entrypoint.sh"]