terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.68.0"
    }
  }

}

provider "aws" {
  region = "us-east-1"
}


# // create a budget for the cumulare account
resource "aws_budgets_budget" "cumulare_budget" {
  name              = "cumulare-budget"
  budget_type       = "COST"
  limit_amount      = ".5"
  limit_unit        = "USD"
  time_unit         = "DAILY"
  time_period_start = "2021-01-01_00:00"

  notification {
    comparison_operator = "GREATER_THAN"
    threshold           = 0.5
    threshold_type =    "PERCENTAGE"
    notification_type   = "ACTUAL"
    subscriber_email_addresses =[""]
  }
}