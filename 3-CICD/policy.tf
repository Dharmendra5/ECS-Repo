# Code build policy
resource "aws_iam_role_policy" "codebuild-policy" {
  role = "${aws_iam_role.codebuild-role.name}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["codecommit:GitPull"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetAuthorizationToken",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
        "ecr:UploadLayerPart"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
        "logs:PutLogEvents"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketAcl",
        "s3:GetBucketLocation"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# S3 access
resource "aws_iam_role_policy_attachment" "s3_bucket_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.my_service_role.name
}

# Code pipeline policy
resource "aws_iam_policy" "pipeline_policy" {
  name = "pipeline_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:ListBucket",
          "iam:PassRole"
        ]
        Resource = "*"
      },
      {
        "Effect": "Allow",
        "Action": [
        "sts:AssumeRole"
        ]
        "Resource": [
          "arn:aws:iam::var.account-id:role/pipeline_role"
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "cloudformation:CreateStack",
          "cloudformation:UpdateStack",
          "cloudformation:DeleteStack",
          "cloudformation:DescribeStacks",
          "cloudformation:DescribeStackEvents",
          "cloudformation:DescribeStackResource",
          "cloudformation:DescribeStackResources",
          "cloudformation:GetTemplate",
          "cloudformation:SetStackPolicy",
          "cloudformation:ValidateTemplate",
          "codecommit:GitPull",
          "codecommit:GetCommit",
          "codecommit:GetBranch",
          "codecommit:GetUploadArchiveStatus",
          "codecommit:CancelUploadArchive",
          "codecommit:GetMergeConflicts",
          "codecommit:GetRepository",
          "codecommit:CreateBranch",
          "codecommit:CreateCommit",
          "codecommit:UploadArchive",
          "codecommit:MergeBranchesByFastForward",
          "ecs:*",
          "codedeploy:*"
        ]
        Resource = "*"
      }
    ]
  })
}

# Attach policy
resource "aws_iam_role_policy_attachment" "pipeline_role_policy_attachment" {
  policy_arn = aws_iam_policy.pipeline_policy.arn
  role       = aws_iam_role.codepipeline_role.name
}


# Code build policy for code pipeline
resource "aws_iam_role_policy_attachment" "pipeline_codebuild_access" {
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
  role       = aws_iam_role.codepipeline_role.name
}