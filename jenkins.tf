resource "aws_instance" "jenkins-instance" {
  ami                    = var.AMIS[var.AWS_REGION]
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main-public-1.id
  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]
  key_name               = data.aws_key_pair.softserve.key_name
  user_data              = data.cloudinit_config.cloudinit-jenkins.rendered

  root_block_device {
    volume_size           = 35
    volume_type           = "gp2"
    delete_on_termination = true
  }
}

resource "aws_ebs_volume" "jenkins-data" {
  availability_zone = "${var.AWS_REGION}a"
  size              = 15
  type              = "gp2"

  tags = {
    ProjectName = var.project_name
    Name        = "jenkins-data"
  }
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name = var.INSTANCE_DEVICE_NAME
  volume_id   = aws_ebs_volume.jenkins-data.id
  instance_id = aws_instance.jenkins-instance.id
  #skip_destroy = true
}