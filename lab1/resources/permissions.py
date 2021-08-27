import boto3
import json

S3API = boto3.client("s3", region_name="us-west-2") 
bucket_name = "fb-s3site"

policy_file = open("/mnt/e/Git/AWS/lab1/resources/public_policy.json", "r")


S3API.put_bucket_policy(
    Bucket = bucket_name,
    Policy = policy_file.read()
)
print ("Setting Permissions - DONE")