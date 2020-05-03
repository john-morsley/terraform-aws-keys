#      ______                           _      
#     |  ____|                         | |     
#     | |__  __  ____ _ _ __ ___  _ __ | | ___ 
#     |  __| \ \/ / _` | '_ ` _ \| '_ \| |/ _ \
#     | |____ >  < (_| | | | | | | |_) | |  __/
#     |______/_/\_\__,_|_| |_| |_| .__/|_|\___|
#                                | |           
#                                |_|           
#

module "keys" {

  source = "./../../../terraform-aws-keys"
  #source = "john-morsley/aws-keys"

  name = "example"

  folder = "keys"

  //  tags = {
  //    Terraform = "true"
  //  }

}