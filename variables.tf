variable "s3_bucket" {
  description = "The name of the bucket containing your uploaded Lambda deployment package."
}

variable "s3_key" {
  description = "The s3 key for your Lambda deployment package."
}

variable "function_name" {
  description = "The name of the Lambda function."
}

variable "handler" {
  description = "The function within your code that Lambda calls to begin execution."
}

variable "runtime" {
  description = "The runtime environment for the Lambda function you are uploading."
}

variable "subnet_ids" {
  type        = "list"
  description = "The VPC subnets in which the Lambda runs."
}

variable "security_group_ids" {
  type        = "list"
  description = "The VPC security groups assigned to the Lambda."
}

// Optional Variables
variable "datadog_log_subscription_arn" {
  description = "Log subscription arn for shipping logs to datadog"
  default     = ""
}

variable "lambda_role_policy" {
  description = "The Lambda IAM Role Policy."
  default = <<END
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
END
}

variable "timeout" {
  description = "The maximum time in seconds that the Lambda can run for."
  default     = 3
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime."
  default     = 128
}

variable "lambda_env" {
  description = "Environment parameters passed to the Lambda function."
  type        = "map"
  default     = {}
}
