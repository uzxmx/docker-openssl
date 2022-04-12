FROM alpine:3.14

ARG branch=master

RUN tmpdir="$(mktemp -d)" \
  && cd ${tmpdir} \
  && apk --no-cache add \
      binutils \
      git \
      perl \
      gcc \
      make \
      musl-dev \
      linux-headers \
  && git clone https://github.com/openssl/openssl.git --depth 1 --branch $branch \
  && cd openssl && ./Configure && make && make install \
  && apk --no-cache del \
      binutils \
      git \
      perl \
      gcc \
      make \
      musl-dev \
      linux-headers \
  && rm -rf /var/cache/apk/* \
  && rm -rf ${tmpdir}
