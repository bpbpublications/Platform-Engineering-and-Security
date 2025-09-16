# audit/cloudtrail.tf
resource "aws_cloudtrail" "platform_audit" {
  name                          = "platform-audit-trail"
  s3_bucket_name                = aws_s3_bucket.audit_logs.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
}

resource "aws_s3_bucket" "audit_logs" {
  bucket        = "platform-audit-logs-${var.env}"
  force_destroy = false
}

