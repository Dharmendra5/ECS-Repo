# EC2 instance creation for ECS
resource "aws_instance" "ec2_instance" {
  ami                    = var.ami-image
  availability_zone      = var.azs[0]
  subnet_id              = aws_subnet.private[0].id
  instance_type          = var.ecs-instance-type
  iam_instance_profile   = aws_iam_instance_profile.ecs-instance-profile.name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name               = var.keys
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = data.template_file.user_data.rendered
  tags = {
    Name = var.ecs-instance-name
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.tpl")
}

# EC2 instance creation for database
resource "aws_instance" "ec2_instance_db" {
  ami                    = var.generic-image
  availability_zone      = var.azs[0]
  subnet_id              = aws_subnet.private[0].id
  instance_type          = var.db-instance-type
  iam_instance_profile   = aws_iam_instance_profile.ecs-instance-profile.name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name               = var.keys
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = data.template_file.user_data_db.rendered
  tags = {
    Name = var.db-instance-name
  }
}

data "template_file" "user_data_db" {
  template = file("${path.module}/user_data_db.tpl")
}

# EC2 instance creation for jump box
resource "aws_instance" "ec2_instance_bastion" {
  ami                         = var.generic-image
  availability_zone           = var.azs[0]
  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true
  instance_type               = var.bastion-instance-type
  iam_instance_profile        = aws_iam_instance_profile.ecs-instance-profile.name
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  key_name                    = var.keys
  ebs_optimized               = "false"
  source_dest_check           = "false"
  tags = {
    Name = var.jump-instance-name
  }
}
