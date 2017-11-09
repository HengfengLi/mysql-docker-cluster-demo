FROM mysql:5.7

ENV REPLICATION_USER replication
ENV REPLICATION_PASSWORD replication_pass

COPY replication-entrypoint.sh /

RUN chmod +x /replication-entrypoint.sh

ENTRYPOINT ["/replication-entrypoint.sh"]
CMD ["mysqld"]
