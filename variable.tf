variable "environments" {
  default = ["dev", "staging", "production"]
}

variable "vpc_id" {
  default = "vpc-008f29e1b5a4f4274"
}

variable "subnet_id" {
  default = "subnet-094f1f90a0ee07d00"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0fd05997b4dff7aac" 
}

variable "bucket_prefix" {
  default = "terraenv"
}
