FROM mariadb:latest
MAINTAINER ChurchCRM

RUN apt-get update \
    && apt-get install -y jq figlet \
    && mkdir -p /scripts/pre-init.d/ \
    && mkdir -p /scripts/pre-exec.d/

COPY ./startup /scripts/startup
RUN chmod +x /scripts/startup

ENTRYPOINT ["/scripts/startup"]