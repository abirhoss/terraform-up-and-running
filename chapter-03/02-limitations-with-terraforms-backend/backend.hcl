# backend.hcl
bucket         = "terraform-up-and-running-state-abirhossain"  # Replace this with your bucket name
region         = "us-east-2"
dynamodb_table = "terraform-up-and-running-locks"  # Replace this with your DynamoDB table name!
encrypt        = true