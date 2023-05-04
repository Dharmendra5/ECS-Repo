module "create-registry" {
    source    = "../modules/ecr"
    repo-name = var.repo-name
}

module "ecs-cluster" {
    source    = "../modules/ecs"
    cluster-name        = var.cluster-name
    vpc-name            = var.vpc-name
    subnet-name-private = var.subnet-name-private
    subnet-name-public  = var.subnet-name-public
    igw                 = var.igw
    route               = var.route
    eip                 = var.eip
    nat                 = var.nat
    route-table         = var.route-table
    sg-name             = var.sg-name 
    ami-image           = var.ami-image
    instance-type       = var.instance-type
    keys                = var.keys
    instance-tag        = var.instance-tag
    ecs-cluster-name    = var.ecs-cluster-name
    ecs-task-name       = var.ecs-task-name
    ecs-service-name    = var.ecs-service-name
    container-name      = var.container-name
    alb-name            = var.alb-name
    alb-target          = var.alb-target
    cloudwatch-name     = var.cloudwatch-name
    cc-repo-name        = var.cc-repo-name
    cc-branch-name      = var.cc-branch-name
    bucket              = var.bucket
    build-project       = var.build-project
    pipeline-name       = var.pipeline
    account-id          = var.accout-id
}


module "pipeline" {
    source    = "../modules/pipeline"
    cc-repo-name     = var.cc-repo-name
    cc-branch-name   = var.cc-branch-name
    bucket           = var.bucket
    build-project    = var.build-project
    pipeline-name    = var.pipeline-name
    ecs-cluster-name = var.ecs-cluster-name
    ecs-service-name = var.ecs-service-name
    account-id       = var.account-id
}
