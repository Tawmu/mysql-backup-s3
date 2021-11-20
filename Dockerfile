FROM alpine:latest
LABEL maintainer="@Tawmu"

COPY /rootfs/ /

RUN apk add --no-cache openssl coreutils mysql-client python3 py3-pip && \
  pip3 install --no-cache-dir awscli && \
  chmod 755 /backup.sh && \
  chmod 755 /run.sh

ENV MYSQLDUMP_OPTIONS --quote-names --quick --add-drop-table --add-locks --allow-keywords --disable-keys --extended-insert --single-transaction --create-options --comments --net_buffer_length=16384
ENV MYSQLDUMP_DATABASE --all-databases
ENV MYSQL_HOST **None**
ENV MYSQL_PORT 3306
ENV MYSQL_USER **None**
ENV MYSQL_PASSWORD **None**
ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_ENDPOINT **None**
ENV S3_S3V4 no
ENV S3_PREFIX 'backup'
ENV S3_FILENAME **None**
ENV MULTI_FILES no
ENV SCHEDULE **None**
ENV DELETE_OLDER_THAN **None**
ENV ENCRYPTION_PASSWORD **None**

CMD ["sh", "run.sh"]
