region                = "us-east-2"
azs                   = ["us-east-2a", "us-east-2b"]
cluster-name          = "ECS-TestSetup"
vpc-name              = "ECS-TestVPC"
subnet-name-private   = "ECS-TestPrivateSubnet"
subnet-name-public    = "ECS-TestPublicSubnet"
igw                   = "ECS-TestIGW"
route                 = "ECS-TestRoute"
eip                   = "ECS-TestEip"
nat                   = "ECS-TestNat"
route-table           = "ECS-TestRouteTable"
sg-name               = "ECS-TestSG"
ami-image             = "ami-021a0ce2b15e85197"
generic-image         = "ami-0a695f0d95cefc163"
db-instance-name      = "DB-TestEC2"
jump-instance-name    = "Bastion-TestEC2"
db-instance-type      = "t2.micro"
ecs-instance-type     = "t2.medium"
bastion-instance-type = "t2.micro"
keys                  = "ECS-TestKey"
ecs-instance-name     = "ECS-TestEC2"
ecs-task-name         = "ECS-Tasks"
ecs-service-name      = "ECS-Rails-Service"
alb-name              = "ECS-TestAlb"
alb-target            = "ECS-TestTarget"
container-name        = "ECS-Rails"
cloudwatch-name       = "ECS-TestCloudwatch"