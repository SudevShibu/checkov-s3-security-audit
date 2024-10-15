resource "aws_s3_bucket" "example" {
  bucket = "my-example-bucket-12345"
  acl    = "private"

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enable encryption with KMS
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "alias/aws/s3" # You can specify your own KMS key alias here
      }
    }
  }

  # Enable access logging (target bucket for logs must be created)
  logging {
    target_bucket = "my-log-bucket"  # Replace with your log bucket name
    target_prefix = "log/"
  }

  # Add lifecycle configuration
  lifecycle_rule {
    id      = "example"
    enabled = true

    transition {
      days          = 30
      storage_class = "GLACIER"
    }

    expiration {
      days = 365
    }
  }

  # Enable event notifications (example using SNS)
  event_notification {
    event_type = ["s3:ObjectCreated:*"]
    topic_arn  = "arn:aws:sns:us-west-2:123456789012:MySNSTopic"  # Replace with your SNS topic ARN
  }
}

# Public Access Block to prevent public access
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Cross-region replication example
resource "aws_s3_bucket_replication_configuration" "example" {
  role = "arn:aws:iam::123456789012:role/s3-replication-role"  # Replace with your IAM role ARN

  rules {
    id     = "ReplicationRule"
    status = "Enabled"

    destination {
      bucket        = "arn:aws:s3:::my-destination-bucket"  # Replace with your destination bucket ARN
      storage_class = "STANDARD"
    }

    filter {
      prefix = ""
    }
  }
}






replication_configuration {
  role = aws_iam_role.replication_role.arn

  rules {
    id     = "ReplicationRule1"
    status = "Enabled"

    destination {
      bucket        = "arn:aws:s3:::destination-bucket"
      storage_class = "STANDARD"
    }

    filter {
      prefix = ""
    }
  }
}

