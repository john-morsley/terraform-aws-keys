#      _  __            _____      _      
#     | |/ /           |  __ \    (_)     
#     | ' / ___ _   _  | |__) |_ _ _ _ __ 
#     |  < / _ \ | | | |  ___/ _` | | '__|
#     | . \  __/ |_| | | |  | (_| | | |   
#     |_|\_\___|\__, | |_|   \__,_|_|_|   
#                __/ |                    
#               |___/                     
#

# https://www.terraform.io/docs/providers/tls/r/private_key.html

resource "tls_private_key" "this" {

  algorithm = "RSA"

}

resource "aws_key_pair" "this" {

  key_name   = var.name
  public_key = tls_private_key.this.public_key_openssh

}

resource "local_file" "public-key" {
  
  filename = "${var.folder}/${var.name}.pub"
  content  = tls_private_key.this.public_key_openssh

}

resource "local_file" "private-key" {
  
  filename = "${var.folder}/${var.name}.pem"
  content  = tls_private_key.this.private_key_pem

}