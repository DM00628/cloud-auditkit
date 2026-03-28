package terraform.s3

deny[msg] {
  bucket := input.resource_changes[_]
  bucket.type == "aws_s3_bucket"
  not bucket.change.after.tags.Owner
  msg := sprintf("%s is missing required tag Owner", [bucket.address])
}

deny[msg] {
  bucket := input.resource_changes[_]
  bucket.type == "aws_s3_bucket"
  not bucket.change.after.tags.System
  msg := sprintf("%s is missing required tag System", [bucket.address])
}

deny[msg] {
  bucket := input.resource_changes[_]
  bucket.type == "aws_s3_bucket"
  not bucket.change.after.tags.DataClassification
  msg := sprintf("%s is missing required tag DataClassification", [bucket.address])
}

deny[msg] {
  bucket := input.resource_changes[_]
  bucket.type == "aws_s3_bucket"
  not companion_resource_exists(bucket.name, "aws_s3_bucket_public_access_block")
  msg := sprintf("%s is missing aws_s3_bucket_public_access_block", [bucket.address])
}

deny[msg] {
  bucket := input.resource_changes[_]
  bucket.type == "aws_s3_bucket"
  not companion_resource_exists(bucket.name, "aws_s3_bucket_server_side_encryption_configuration")
  msg := sprintf("%s is missing server side encryption configuration", [bucket.address])
}

deny[msg] {
  bucket := input.resource_changes[_]
  bucket.type == "aws_s3_bucket"
  not companion_resource_exists(bucket.name, "aws_s3_bucket_versioning")
  msg := sprintf("%s is missing versioning configuration", [bucket.address])
}

deny[msg] {
  block := input.resource_changes[_]
  block.type == "aws_s3_bucket_public_access_block"
  not block.change.after.block_public_acls
  msg := sprintf("%s must set block_public_acls to true", [block.address])
}

deny[msg] {
  block := input.resource_changes[_]
  block.type == "aws_s3_bucket_public_access_block"
  not block.change.after.block_public_policy
  msg := sprintf("%s must set block_public_policy to true", [block.address])
}

deny[msg] {
  block := input.resource_changes[_]
  block.type == "aws_s3_bucket_public_access_block"
  not block.change.after.ignore_public_acls
  msg := sprintf("%s must set ignore_public_acls to true", [block.address])
}

deny[msg] {
  block := input.resource_changes[_]
  block.type == "aws_s3_bucket_public_access_block"
  not block.change.after.restrict_public_buckets
  msg := sprintf("%s must set restrict_public_buckets to true", [block.address])
}

companion_resource_exists(name, resource_type) {
  some i
  resource := input.resource_changes[i]
  resource.type == resource_type
  contains(resource.address, name)
}
