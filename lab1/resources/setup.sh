#!/bin/bash 
pip3 install boto3
echo ''
echo Please enter a valid IP address:
read ip_address
echo IP address:$ip_address
bucket=`aws s3api list-buckets --query "Buckets[].Name" | sed -e 's/\]//g' | sed -e 's/"//g' | sed -e 's/\[//g' | xargs`
echo export bucket=`aws s3api list-buckets --query "Buckets[].Name" | sed -e 's/\]//g' | sed -e 's/"//g' | sed -e 's/\[//g' | xargs` >> /home/cerjey/.bashrc
echo export bucket_url="https://${bucket}.s3-us-west-2.amazonaws.com/index.html" >> /home/cerjey/.bashrc
FILE_PATH="/mnt/e/Git/AWS/lab1/resources/public_policy.json"
FILE_PATH_2="/mnt/e/Git/AWS/lab1/resources/permissions.py"
aws s3 cp --cache-control max-age=0 --content-type image/jpg /mnt/e/Git/AWS/lab1/resources/website/backdrop_camera.jpg s3://$bucket/backdrop_camera.jpg 
aws s3 cp --cache-control max-age=0 --content-type text/html /mnt/e/Git/AWS/lab1/resources/website/callback.html s3://$bucket/callback.html
aws s3 cp --cache-control max-age=0 --content-type application/javascript /mnt/e/Git/AWS/lab1/resources/website/config.js s3://$bucket/config.js
aws s3 cp --cache-control max-age=0 --content-type text/css /mnt/e/Git/AWS/lab1/resources/website/core.css s3://$bucket/core.css
aws s3 cp --cache-control max-age=0 --content-type application/javascript /mnt/e/Git/AWS/lab1/resources/website/flex_search.js s3://$bucket/flex_search.js
aws s3 cp --cache-control max-age=0 --content-type text/html /mnt/e/Git/AWS/lab1/resources/website/index.html s3://$bucket/index.html
aws s3 cp --cache-control max-age=0 --content-type application/javascript /mnt/e/Git/AWS/lab1/resources/website/jquery.js s3://$bucket/jquery.js
aws s3 cp --cache-control max-age=0 --content-type image/png /mnt/e/Git/AWS/lab1/resources/website/kiosk.png s3://$bucket/kiosk.png
aws s3 cp --cache-control max-age=0 --content-type image/png /mnt/e/Git/AWS/lab1/resources/website/kiosk_bottom.png s3://$bucket/kiosk_bottom.png
aws s3 cp --cache-control max-age=0 --content-type image/png /mnt/e/Git/AWS/lab1/resources/website/kiosk_left.png s3://$bucket/kiosk_left.png
aws s3 cp --cache-control max-age=0 --content-type image/png /mnt/e/Git/AWS/lab1/resources/website/kiosk_right.png s3://$bucket/kiosk_right.png
aws s3 cp --cache-control max-age=0 --content-type image/png /mnt/e/Git/AWS/lab1/resources/website/kiosk_top.png s3://$bucket/kiosk_top.png
aws s3 cp --cache-control max-age=0 --content-type text/css /mnt/e/Git/AWS/lab1/resources/website/main.css s3://$bucket/main.css
aws s3 cp --cache-control max-age=0 --content-type application/javascript /mnt/e/Git/AWS/lab1/resources/website/main.js s3://$bucket/main.js
aws s3 cp --cache-control max-age=0 --content-type application/javascript /mnt/e/Git/AWS/lab1/resources/website/products.js s3://$bucket/products.js
aws s3 cp --cache-control max-age=0 --content-type text/html /mnt/e/Git/AWS/lab1/resources/website/report.html s3://$bucket/report.html
aws s3 cp --cache-control max-age=0 --content-type text/css /mnt/e/Git/AWS/lab1/resources/website/reset.css s3://$bucket/reset.css
aws s3 cp --cache-control max-age=0 --content-type text/css /mnt/e/Git/AWS/lab1/resources/website/search.css s3://$bucket/search.css
aws s3 cp --cache-control max-age=0 --content-type application/javascript /mnt/e/Git/AWS/lab1/resources/website/search.js s3://$bucket/search.js
sed -i "s/<FMI_1>/$bucket/g" $FILE_PATH
sed -i "s/<FMI_2>/$ip_address/g" $FILE_PATH
sed -i "s/<FMI_3>/$ip_address/g" $FILE_PATH
sed -i "s/<FMI>/$bucket/g" $FILE_PATH_2
python3 /mnt/e/Git/AWS/lab1/resources/permissions.py