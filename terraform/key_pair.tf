resource "aws_key_pair" "devops_key" {
  key_name   = "aws-devops-key"
  public_key = var.ssh_public_key
}
