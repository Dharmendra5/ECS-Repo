# Generic variables
region    = "us-east-2"
azs       =  ["us-east-2a", "us-east-2b"]

# ECR variables
repo-name =  "ecstestimagerepo"

# ECS variables
cluster-name          = "ECS-TestSetup"
ecs-task-name         = "ECS-Tasks"
ecs-service-name      = "ECS-Rails-Service"
alb-name              = "ECS-TestAlb"
alb-target            = "ECS-TestTarget"
container-name        = "ECS-Rails"
cloudwatch-name       = "ECS-TestCloudwatch"

# Network variables
vpc-name              = "ECS-TestVPC"
subnet-name-private   = "ECS-TestPrivateSubnet"
subnet-name-public    = "ECS-TestPublicSubnet"
igw                   = "ECS-TestIGW"
route                 = "ECS-TestRoute"
eip                   = "ECS-TestEip"
nat                   = "ECS-TestNat"
route-table           = "ECS-TestRouteTable"
sg-name               = "ECS-TestSG"

# EC2 variables
ami-image             = {"us-east-2" = "ami-021a0ce2b15e85197"
                        "us-east-2"  = "ami-0a695f0d95cefc163"
                        "us-east-2"  = "ami-0a695f0d95cefc163"}
instance-tag          = ["DB-TestEC2", "Bastion-TestEC2" "ECS-TestEC2"]
instance-type         = "t2.medium"
keys                  = "ECS-TestKey"

# Pipeline variables
cc-repo-name     = "ECS-TestCCRepo"
cc-branch-name   = "main"
bucket           = "ecs-test-artifactory-000"
build-project    = "ECS-Test-codebuild"
pipeline-name    = "ECS-Test-Codepipeline"
ecs-cluster-name = "ECS-TestSetup"
ecs-service-name = "ECS-Rails-Service"
account-id       = "784582181785"