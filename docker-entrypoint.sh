#!/bin/sh
# vim:sw=4:ts=4:et

set -e

# clone repository if empty /repository
if [ -n "$GIT_REPOSITORY" ] && [ -z "$(ls -A /repository)" ]; then
    if [ -n "$GIT_BRANCH" ]; then
        git clone -b "$GIT_BRANCH" "$GIT_REPOSITORY" /repository
    else
        git clone "$GIT_REPOSITORY" /repository
    fi
fi

# git checkout to branch
if [ -n "$GIT_BRANCH" ]; then
    git checkout "$GIT_BRANCH"
fi

# add cron job
if [ -n "$GIT_REPOSITORY" ] && [ -n "$CRON_TIME_STRING" ]; then
    echo "${CRON_TIME_STRING} cd /repository && git pull" > /var/spool/cron/crontabs/root
fi

exec "$@"
