resource "aws_instance" "example" {
  for_each = toset(var.environments)
  
  ami                     = var.ami_id
  instance_type           = var.instance_type
  associate_public_ip_address = true  # Set to true to assign a public IP to the instance (optional)

  tags = {
    Name        = "${each.key}-instance"
    Environment = each.key
  }
}

resource "aws_s3_bucket" "example" {
  for_each = toset(var.environments)

  bucket = "${var.bucket_prefix}-${each.key}"
  acl    = "private"  

  versioning {
    enabled = true
  }

  # Server-Side Encryption for added security
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"  # AES256 encryption algorithm for objects in the bucket
      }
    }
  }

  tags = {
    Environment = each.key
  }
}
