# AWS Lambda Terraform Module

[![Build Status](https://travis-ci.org/mergermarket/tf_aws_lambda.svg?branch=master)](https://travis-ci.org/mergermarket/tf_aws_lambda)

This module will deploy a Lambda function.

## Module Input Variables

- `s3_bucket` - (string) - **REQUIRED** - The name of the bucket containing your uploaded Lambda deployment package.
- `s3_key` - (string) - **REQUIRED** - The s3 key for your Lambda deployment package.
- `function_name` - (string) - **REQUIRED** - The name of the Lambda function.
- `handler` - (map) - **REQUIRED** - The function within your code that Lambda calls to begin execution.
- `runtime` - (string) - **REQUIRED** The runtime environment for the Lambda function you are uploading.
- `subnet_ids` - (string) - **REQUIRED** The VPC subnets in which the Lambda runs.
- `security_group_ids` - (string) - **REQUIRED** The VPC security groups assigned to the Lambda.
- `lambda_role_policy` (string) - The Lambda IAM Role Policy.
- `timeout` (number) - The maximum time in seconds that the Lambda can run for
- `memory_size` (number) - Amount of memory in MB your Lambda Function can use at runtime
- `lambda_env` - (string) - Environment parameters passed to the Lambda function


## Usage

```hcl
module "lambda" {
  source                    = "github.com/mergermarket/tf_aws_lambda"
  s3_bucket                 = "s3_bucket_name"
  s3_key                    = "s3_key_for_lambda"
  function_name             = "do_foo"
  handler                   = "do_foo_handler"
  runtime                   = "nodejs"
  timeout                   = 5
  memory_size               = 256
  lambda_env                = "${var.lambda_env}"
}
```
Lambda environment variables file:
```json
{
  "lambda_env": {
    "environment_name": "ci-testing"
  }
}
```
