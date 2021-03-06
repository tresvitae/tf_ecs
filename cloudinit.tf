data "template_file" "jenkins-init" {
  template = file("scripts/jenkins-init.sh")
  vars = {
    DEVICE = var.INSTANCE_DEVICE_NAME
  }
}

data "cloudinit_config" "cloudinit-jenkins" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.jenkins-init.rendered
  }
}

