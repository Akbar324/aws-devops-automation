resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.invalid_instance_type ? "t3.micro" : var.instance_type
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = aws_key_pair.devops_key.key_name
  associate_public_ip_address = true
  subnet_id                   = "subnet-09af51bc6ed98a4f8"

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "devops-web-server"
  }
}
