variable "environments" {
  default = ["dev", "staging", "production"]
}

variable "vpc_id" {
  default = "vpc-00624812baf5bbc23"
}

variable "subnet_id" {
  default = "subnet-0c487e2cae9a0e253"
}

variable "instance_type" {
  default = "t2.large"
}

variable "ami_id" {
  default = "ami-01816d07b1128cd2d" 
}

variable "bucket_prefix" {
  default = "terraenv"
}
