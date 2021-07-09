# Docker image for openssl

This docker image provides openssl command.

## Development

For developers in China, when it's slow to download alpine packages, you can use
a mirror e.g. `mirrors.tuna.tsinghua.edu.cn`.

```
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
  && apk add --no-cache ... \
  && ... \
  && apk del ...
```
