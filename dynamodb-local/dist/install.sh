#!/bin/sh

set -x

cd /opt/dist
mkdir /opt/dynamodb

# http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html
wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz
tar zxvf dynamodb_local_*.tar.gz -C /opt/dynamodb

rm -rf /opt/dist

