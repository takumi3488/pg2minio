#!/bin/sh -e
mc alias set minio $MINIO_ENDPOINT $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
mc cp minio/$MINIO_BUCKET/backup.sql /tmp/backup.sql
POSTGRES_URL="postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB"
PGPASSWORD="$POSTGRES_PASSWORD" psql -d $POSTGRES_URL -w -f /tmp/backup.sql
datetime=$(date '+%Y-%m-%d %H:%M:%S')
echo "[${datetime}] Restore completed"
