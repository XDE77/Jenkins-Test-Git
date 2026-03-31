terraform {
backend "s3" {
    bucket  = "terraform-jenkins-xde"       # Name of the S3 bucket
    key     = "keep_trying.tfstate"         # The name of the state file in the bucket
    region  = "us-west-1"                   # Use a variable for the region
    encrypt = true                          # Enable server-side encryption (optional but recommended)
  }
}

resource "aws_s3_object" "Communication_With_Theo" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Communication_with_Theo.png"
  source       = "./Proof/Communication with Theo.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Successful_push_from_GitHub" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Successful_push_from_GitHub.png"
  source       = "./Proof/Successful push from GitHub.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Successful_TF_deployment" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Successful_TF_deployment.png"
  source       = "./Proof/Successful TF deployment.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Successful_TF_deployment_2" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Successful_TF_deployment_2.png"
  source       = "./Proof/Successful TF deployment 2.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Successful_TF_install" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Successful_TF_install.png"
  source       = "./Proof/Successful TF install.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Successful_Webhook_1" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Successful_Webhook_1.png"
  source       = "./Proof/Successful Webhook 1.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Successful_Webhook_2" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Successful_Webhook_2.png"
  source       = "./Proof/Successful Webhook 2.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Successful_Webhook_3" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Successful_Webhook_3.png"
  source       = "./Proof/Successful Webhook 3.png"
  content_type = "image/png"

}

resource "aws_s3_object" "Armageddon_Link" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Armageddon_Link.md"
  source       = "./Proof/Armageddon Link.md"
  content_type = "text/markdown"

}

resource "aws_s3_object" "Class_7_g-check_grading_rubric" {
  bucket       = aws_s3_bucket.terraform-jenkins-xde.bucket
  key          = "Class_7_g-check_grading_rubric.md"
  source       = "./Proof/Class 7 g-check grading rubric.md"
  content_type = "text/markdown"

}

resource "aws_s3_bucket_public_access_block" "terraform-jenkins-xde" {
  bucket = aws_s3_bucket.terraform-jenkins-xde.id

  block_public_acls  = true
  ignore_public_acls = true

  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "terraform-jenkins-xde" {
  bucket = aws_s3_bucket.terraform-jenkins-xde.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicAccess"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.terraform-jenkins-xde.arn}/*"
      }
    ]
  })
}