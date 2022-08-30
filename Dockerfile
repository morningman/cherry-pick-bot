FROM alpine:latest

LABEL version="1.0.0"
LABEL repository="http://github.com/morningman/cherry-pick-bot"
LABEL homepage="http://github.com/morningman/cherry-pick-bot"
LABEL maintainer="morningman"
LABEL "com.github.actions.name"="cherry-pick-bot"
LABEL "com.github.actions.description"="Cherry-pick Bot"
LABEL "com.github.actions.icon"="git-commit"
LABEL "com.github.actions.color"="gray-dark"

RUN apk add --update git jq bash curl coreutils && rm -rf /var/cache/apk/*

RUN curl -LO -s https://github.com/cli/cli/releases/download/v1.2.0/gh_1.2.0_linux_386.tar.gz && \
    tar -xf gh_1.2.0_linux_386.tar.gz

ENV PATH=${PATH}:/gh_1.2.0_linux_386/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
