# Docker git pull

Docker image with git pull by cron

## Example docker-compose.yaml:

```yaml
version: "3.9"
services:

  gitpull:
    image: overdese/gitpull:0.0.1
    environment:
      - GIT_REPOSITORY=git@github.com:overdese/overdese.github.io.git
      - CRON_TIME_STRING=*/1 * * * *
    #   - GIT_BRANCH=master # branch for pull. Optional
    volumes:
      - /data/public:/repository # directory with repo
      - /my_deploy_key/id_rsa:/root/.ssh/id_rsa:ro # ssh key
```

