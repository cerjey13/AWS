#!/bin/bash
bucket=`aws s3api list-buckets --query "Buckets[].Name" | tr -d '[]' | sed 's/"//g'| xargs`
#Test
echo $bucket
# aws s3 cp /mnt/e/Git/AWS/lab1/node_10.18.1/get_reviews.zip s3://$bucket/get_reviews.zip
# aws s3 cp /mnt/e/Git/AWS/lab1/node_10.18.1/get_ratings.zip s3://$bucket/get_ratings.zip
# aws s3 cp /mnt/e/Git/AWS/lab1/node_10.18.1/create_report.zip s3://$bucket/create_report.zip
# aws s3 cp /mnt/e/Git/AWS/lab1/node_10.18.1/sentiment_code.zip s3://$bucket/sentiment.zip
# aws s3 cp /mnt/e/Git/AWS/lab1/node_10.18.1/tag.zip s3://$bucket/tag.zip
aws s3 cp /mnt/e/Git/AWS/lab1/node_10.18.1/publish.zip s3://$bucket/publish.zip
