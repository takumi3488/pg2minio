#!/bin/sh -e
mc alias set minio http://localhost:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
mc ls minio/$MINIO_BUCKET