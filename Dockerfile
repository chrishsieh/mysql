FROM mariadb:latest
MAINTAINER ChurchCRM

RUN apt-get update \
    && apt-get install -y jq \
    && mkdir -p /scripts/pre-init.d/

COPY ./startup /scripts/startup
RUN chmod +x /scripts/startup
ENV TERM="xterm-color"

ENTRYPOINT ["/scripts/startup"]