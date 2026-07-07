# S3 Backend for Terraform State
# IMPORTANT: Follow these steps to enable remote state management:
#
# 1. First run: terraform init
#    This initializes Terraform with local state
#
# 2. Run: terraform apply
#    This provisions the initial resources including the website
#
# 3. Manually create an S3 bucket for Terraform state (if not already created):
#    aws s3api create-bucket \
#      --bucket terraform-state-<account-id> \
#      --region ap-south-1 \
#      --create-bucket-configuration LocationConstraint=ap-south-1
#
# 4. Enable versioning on the state bucket:
#    aws s3api put-bucket-versioning \
#      --bucket terraform-state-<account-id> \
#      --versioning-configuration Status=Enabled
#
# 5. Uncomment the configuration below and update the bucket name
#
# 6. Run: terraform init -migrate-state
#    This migrates your local state to S3
#
# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-<account-id>"
#     key            = "portfolio-site/terraform.tfstate"
#     region         = "ap-south-1"
#     encrypt        = true
#     dynamodb_table = "terraform-locks"
#   }
# }
