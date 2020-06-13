# Terraform Key Pairs in AWS

## Examples

For examples how to use, please refer to the examples folder.

## Usage

```
module "keys" {

  source = "john-morsley/aws-keys"

  name = "example"

  tags = {
    Terraform = "true"
  }

}
```