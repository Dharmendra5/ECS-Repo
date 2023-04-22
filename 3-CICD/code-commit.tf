resource "aws_codecommit_repository" "my_repo" {
  repository_name = var.cc-repo-name
}