module "keys" {

  source = "./../../../terraform-aws-keys"
  #source = "john-morsley/aws-keys"

  name = "example"

  folder = "keys"

  //  tags = {
  //    Terraform = "true"
  //  }

}