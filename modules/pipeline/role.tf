# Code build role
resource "aws_iam_role" "codebuild-role" {
  name = "codebuild-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      },
    ]
  })
}

# Code commit role
resource "aws_iam_policy" "codecommit_policy" {
  name = "codecommit-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "codecommit:GitPull",
          "codecommit:GetRepository",
          "codecommit:ListRepositories",
        ]
        Effect = "Allow"
        Resource = "arn:aws:codecommit:${var.region}:${var.account-id}:ECS-TestCCRepo"
      },
    ]
  })
}

# Code pipeline role
resource "aws_iam_role" "codepipeline_role" {
  name = "pipeline_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "codepipeline.amazonaws.com"
        }
      }
    ]
  })
}

# S3 role
resource "aws_iam_role" "my_service_role" {
  name = "my-service-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}