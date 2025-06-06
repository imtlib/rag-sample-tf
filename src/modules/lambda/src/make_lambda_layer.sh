#!/bin/bash -eu

BUCKETNAME=$1
LAYERNAME=$2
SRC=./python
DIST=./layer.zip

pip3.10 install -t ${SRC} -r requirements.txt
rm -f ${DIST}
zip -q -r ${DIST} ${SRC}

aws s3 cp ./layer.zip s3://$BUCKETNAME/layer/layer.zip
aws lambda publish-layer-version \
    --layer-name $LAYERNAME \
    --compatible-runtimes python3.10 \
    --content S3Bucket=$BUCKETNAME,S3Key=layer/layer.zip