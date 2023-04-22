# Pipeline create
resource "aws_codepipeline" "pipeline" {
  name     = var.pipeline-name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.bucket-artifact.bucket
    type     = "S3"
  }

  # SOURCE
  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        RepositoryName = var.cc-repo-name
        BranchName     = var.cc-branch-name
      }
    }
  }

  # BUILD
  stage {
    name = "Test"
    action {
      name             = "Test"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]

      configuration = {
        ProjectName = var.build-project
      }
    }
  }

  # DEPLOY
  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ECS"
      version         = "1"
      input_artifacts = ["build_output"]

      configuration = {
        ClusterName = var.ecs-cluster-name
        ServiceName = var.ecs-service-name 
        FileName    = "imagedefinitions.json"
      }
    }
  }
}