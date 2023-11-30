#!/bin/bash

# Fetch MySQL credentials from AWS Secrets Manager
AWS_SECRET_JSON=$(aws secretsmanager get-secret-value --secret-id arn:aws:secretsmanager:us-west-1:590804171223:secret:staging/mysql/Wait_Lister-ZaEooo --region us-west-1)
MYSQL_USERNAME=$(echo $AWS_SECRET_JSON | jq -r '.SecretString | fromjson | .MYSQL_USER')
MYSQL_PASSWORD=$(echo $AWS_SECRET_JSON | jq -r '.SecretString | fromjson | .MYSQL_PASSWORD')
MYSQL_ROOT_PASSWORD=$(echo $AWS_SECRET_JSON | jq -r '.SecretString | fromjson | .MYSQL_ROOT_PASSWORD')
MYSQL_DATABASE=$(echo $AWS_SECRET_JSON | jq -r '.SecretString | fromjson | .MYSQL_DATABASE')

# Start MySQL with fetched credentials
exec docker-entrypoint.sh mysqld --user="$MYSQL_USERNAME" --password="$MYSQL_PASSWORD" --database="$MYSQL_DATABASE" "$@"
