#!/bin/bash 
pip3 install boto3
echo ''
echo Please enter a valid email address:
read email_address
echo Email address:$email_address
echo Please enter a valid phone number.  Example 0000000000:
read phone_number
echo Phone number:$phone_number
echo Please enter a valid IP address:
read ip_address
echo IP address:$ip_address
echo Please wait...
pip3 install --upgrade awscli
bucket=`aws s3api list-buckets --query "Buckets[].Name" | tr -d '[]' | sed 's/"//g'| xargs`
apigateway=`aws apigateway get-rest-apis | grep id | tr -d ',' | xargs | cut -f2- -d:`
echo $apigateway
FILE_PATH="/mnt/e/Git/AWS/lab1/resources/public_policy.json"
FILE_PATH_2="/mnt/e/Git/AWS/lab1/resources/permissions.py"
FILE_PATH_3="/mnt/e/Git/AWS/lab1/resources/setup.sh"
FILE_PATH_4="/mnt/e/Git/AWS/lab1/resources/website/config.js"
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
#sed -i "s/<FMI_3>/$ip_address/g" $FILE_PATH
sed -i "s/<FMI>/$bucket/g" $FILE_PATH_2
python3 /mnt/e/Git/AWS/lab1/resources/permissions.py
## crear url desde 0
# POOL_ID=`aws cognito-idp list-user-pools --max-results 1 | grep Id | tr -d ':,' | sed -e 's/Id//g' | xargs`
# NUMBER=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | sed -e 's/^0*//' | head --bytes 4)
# if [ "$NUMBER" == "" ]; then
#   NUMBER=0
# fi
# aws cognito-idp update-user-pool --user-pool-id $POOL_ID --account-recovery-setting 'RecoveryMechanisms=[{Priority=1,Name=verified_email}]' \
# --admin-create-user-config 'AllowAdminCreateUserOnly=true'
# aws cognito-idp admin-create-user --user-pool-id $POOL_ID \
# --username inw \
# --temporary-password "!FooBar55" \
# --user-attributes Name=email,Value=$email_address Name=email_verified,Value=true Name=phone_number_verified,Value=true Name=phone_number,Value="+526645383320" \
# --desired-delivery-mediums EMAIL \
# --message-action SUPPRESS
# --username inw \
# --temporary-password "!FooBar55" \
# --user-attributes Name=email,Value='tinguerd@gmail.com' Name=email_verified,Value=true Name=phone_number_verified,Value=true Name=phone_number,Value="+526645383320" \
# --desired-delivery-mediums EMAIL \
# --message-action SUPPRESS
# aws cognito-idp create-user-pool-domain --user-pool-id $POOL_ID --domain fancy$-domain 
# aws cognito-idp create-user-pool-client \
# --user-pool-id $POOL_ID  --client-name FancyApp \
# --no-generate-secret --explicit-auth-flows "ALLOW_REFRESH_TOKEN_AUTH" \
# --allowed-o-auth-flows-user-pool-client \
# --supported-identity-providers COGNITO \
# --prevent-user-existence-errors ENABLED \
# --callback-urls '["https://'$bucket'.s3-us-west-2.amazonaws.com/callback.html"]' \
# --logout-urls '["https://'$bucket'.s3-us-west-2.amazonaws.com/sign-out.html"]' \
# --allowed-o-auth-flows implicit \
# --allowed-o-auth-scopes "openid" "profile" 
# aws cognito-idp admin-set-user-password --user-pool-id $POOL_ID --username cerj --password "!FooBar55" --permanent
# CLIENT_ID=`aws cognito-idp list-user-pool-clients --user-pool-id $POOL_ID | grep ClientId | cut -f2- -d: | tr -d ',' | xargs`
# COG_STRING="https://fancy${NUMBER}-domain.auth.us-west-2.amazoncognito.com/login?client_id=${CLIENT_ID}\&response_type=token\&scope=openid+profile\&redirect_uri=https://${bucket}.s3-us-west-2.amazonaws.com/callback.html"
# GW_STRING="https://${apigateway}.execute-api.us-west-2.amazonaws.com/test"
# sed -i 's~G_COGNITO_HOSTED_URL_STR = null~G_COGNITO_HOSTED_URL_STR = \"'$COG_STRING'\"~' $FILE_PATH_4
# sed -i 's~G_API_GW_URL_STR = null~G_API_GW_URL_STR = \"'$GW_STRING'\"~' $FILE_PATH_4
# aws s3 cp /mnt/e/Git/AWS/lab1/resources/website/config.js s3://$bucket/config.js
# zip -j /mnt/e/Git/AWS/lab1/resources/index.zip /mnt/e/Git/AWS/lab1/resources/index.js
# aws lambda update-function-code --function-name validate --zip-file fileb:///mnt/e/Git/AWS/lab1/resources/index.zip
# zip -j /mnt/e/Git/AWS/lab1/resourcescreate_pre_signed_url.zip /mnt/e/Git/AWS/lab1/resourcescreate_pre_signed_url.js
# aws lambda update-function-code --function-name create_pre_signed_url --zip-file fileb://create_pre_s
# igned_url.zip
echo DONE