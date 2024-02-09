FROM postgres:16

RUN ARCH=$(dpkg --print-architecture) && \
    apt-get update && apt-get install -y curl && \
    curl -sL https://dl.min.io/client/mc/release/linux-${ARCH}/mc > /usr/local/bin/mc && \
    chmod +x /usr/local/bin/mc

COPY ./exec.sh /exec.sh
RUN chmod +x /exec.sh

ENTRYPOINT ["/exec.sh"]
