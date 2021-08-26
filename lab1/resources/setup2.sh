#!/bin/bash
bucket=`aws s3api list-buckets --query "Buckets[].Name" | sed -e 's/\]//g' | sed -e 's/"//g' | sed -e 's/\[//g' | xargs`
#echo $bucket
aws s3 cp /mnt/e/Git/AWS/lab1/resources/website/config.js s3://$bucket/config.js
