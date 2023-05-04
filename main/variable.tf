# Generic variables
variable "region"                {}
variable "azs"                   {}

# ECR variabled
variable "repo-name"             {}

# ECS, Network and EC2 variables
variable "cluster-name"          {}
variable "vpc-name"              {}
variable "subnet-name-private"   {}
variable "subnet-name-public"    {}
variable "igw"                   {}
variable "route"                 {}
variable "eip"                   {}
variable "nat"                   {}
variable "route-table"           {}
variable "sg-name"               {}
variable "ami-image"             {}
variable "instance-type"         {}
variable "keys"                  {}
variable "instance-tag  "        {}
variable "ecs-task-name"         {}
variable "ecs-service-name"      {}
variable "container-name"        {}
variable "alb-name"              {}
variable "alb-target"            {}
variable "cloudwatch-name"       {}

# Pipeline variables
variable "cc-repo-name"          {}
variable "cc-branch-name"        {}
variable "bucket"                {}
variable "build-project"         {}
variable "pipeline-name"         {}
variable "ecs-cluster-name"      {}
variable "ecs-service-name"      {}
variable "account-id"            {}
