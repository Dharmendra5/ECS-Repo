#!/bin/bash

# Set variables
DB_HOST_IP="10.32.2.248"
DB_NAME="postgres"
DB_USER="appdb"
DB_PASS="12345"
S3_BUCKET="ecs-test-artifactory-000"
BACKUP_FILENAME="ruby-appdbbackup.sh"

# Connect to remote machine via SSH and create backup file
ssh -i /home/ubuntu/ECS-TestKey.pem ubuntu@$DB_HOST_IP "sudo pg_dump -U $DB_USER -F c $DB_NAME > $BACKUP_FILENAME"

# Copy backup file from remote machine to local machine
scp -i /home/ubuntu/ECS-TestKey.pem ubuntu@$DB_HOST_IP:$BACKUP_FILENAME .

# Push backup to S3 bucket
aws s3 cp $BACKUP_FILENAME s3://$S3_BUCKET/db-backup/

# Remove local backup file
rm $BACKUP_FILENAME
