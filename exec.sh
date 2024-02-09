#!/bin/sh -e
mc alias set minio $MINIO_ENDPOINT $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
mc mb -p minio/$MINIO_BUCKET
POSTGRES_URL="postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT/$POSTGRES_DB"
PGPASSWORD="$POSTGRES_PASSWORD" pg_dumpall -d $POSTGRES_URL -w > /tmp/pg.dump 
mc cp /tmp/pg.dump minio/$MINIO_BUCKET/pg.dump
datetime=$(date '+%Y-%m-%d %H:%M:%S')
echo "[${datetime}] Backup completed"
