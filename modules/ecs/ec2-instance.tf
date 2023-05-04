# EC2 instance creation for ECS
resource "aws_instance" "ec2_instance" {
  count                  = length(keys(var.ami-image))
  ami                    = lookup(var.ami-image, element(keys(var.ami-image), count.index))
  availability_zone      = var.azs[0]
  subnet_id              = aws_subnet.private[0].id
  instance_type          = var.instance-type
  iam_instance_profile   = aws_iam_instance_profile.ecs-instance-profile.name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  key_name               = var.keys
  ebs_optimized          = "false"
  source_dest_check      = "false"
  user_data              = data.template_file.user_data.rendered
  tags = {
    Name = lookup(var.instance-tag, self.ami, count.index)
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data.tpl")
}