FROM alpine:3.16
RUN apk add --no-cache squid ca-certificates openssl
RUN echo "logfile_rotate 0" >> /etc/squid/squid.conf && \
    echo "access_log stdio:/dev/stdout" >> /etc/squid/squid.conf && \
    echo "cache_log stdio:/dev/stdout" >> /etc/squid/squid.conf
COPY start.sh .
CMD ["./start.sh"]
