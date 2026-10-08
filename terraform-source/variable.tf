variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "ca-central-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use for the instance"
  default     = "ami-0bf6dbeae330f5823"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "EC2 Key pair name"
  default     = "dnag-kp"
}

variable "environment" {
  type    = string
  default = "dev"
}

