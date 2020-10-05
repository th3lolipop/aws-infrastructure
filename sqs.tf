data "aws_iam_policy_document" "format" {
  statement {
    sid     = "First"
    actions = ["sqs:*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    resources = ["module.sqs.this_sqs_queue_arn"]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"

      values = ["module.sqs.this_sqs_queue_url"]
    }
  }
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "2.1.0"

  create = var.sqs.create
  name   = var.sqs.name

  #Configuration
  visibility_timeout_seconds = var.sqs.visible_time

  #Basic Policy
  policy = data.aws_iam_policy_document.format.json

  #Tagging
  tags = {
    Name        = var.sqs.name
    Environment = var.sqs.env
    Owner       = var.sqs.owner
    Project     = var.sqs.project
    Team        = var.sqs.team
  }
}
