variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}
variable "allowed_ssh_cidr" {
  description = "Approved public IP address for SSH access"
  type        = string
}
variable "ssh_public_key" {
  description = "SSH public key for the EC2 instance"
  type        = string
}
