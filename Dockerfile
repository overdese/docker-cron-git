FROM alpine:3.15.2

RUN apk update && apk add --no-cache \
    openssh-client \
    git && \
    git config --global core.sshCommand "ssh -i /root/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -q"

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /repository

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "/usr/sbin/crond", "-f"]
