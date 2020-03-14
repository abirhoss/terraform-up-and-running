# backend.hcl
bucket         = "terraform-up-and-running-state-abirhossain"  # Replace this with your bucket name
region         = "ap-southeast-2"
dynamodb_table = "terraform-up-and-running-locks"  # Replace this with your DynamoDB table name!
encrypt        = true