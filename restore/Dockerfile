FROM postgres:16

WORKDIR /app

RUN ARCH=$(dpkg --print-architecture) && \
    apt-get update && apt-get install -y curl && \
    curl -sL https://dl.min.io/client/mc/release/linux-${ARCH}/mc > /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

COPY ./restore.sh /restore.sh
RUN chmod +x /restore.sh

ENTRYPOINT ["/restore.sh"]
