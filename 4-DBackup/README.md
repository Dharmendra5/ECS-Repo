# Prerequsistes

- Login into bastion EC2 instance
- Makesure `.pem` file is available under ubuntu home directory
- Makesure bash script is available in ubuntu home directory
- Makesure `.pem` file is with required previlage `(chmod 400 ./backuo.sh)`
- Makesure `backup.sh` file with required previlage `(chmod +x backup.sh)`
- Makesure aws cli is installed in EC2 instance `(sudo apt install aws*)`
- Makesure required policy is attached with s3 bucket to write object in it.

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowAll",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:PutObject",
                "s3:PutObjectAcl"
            ],
            "Resource": "arn:aws:s3:::ecs-test-artifactory-000/*"
        }
    ]
}
```

# How to schedule cronjob

- Run `sudo crontab -e`
- Paste below job which can perform database backup by triggering script, job will be triggered on every day night at 12am.
- Also this job is going to erase 1 to 5 files from 30 days which is stored in s3 bucket.

```
0 0 * * * /home/ubuntu/backup.sh && aws s3 ls s3://ecs-test-artifactory-000/db-backup/ | grep 'prefix/' | sort | head -n -5 | awk '{print $4}' | xargs -I {} aws s3 rm s3://ecs-test-artifactory-000/db-backup/{}
```

- How to check if cronjob is scheduled
- sudo crontab -l