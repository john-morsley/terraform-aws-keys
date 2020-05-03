#      _  __            _____      _      
#     | |/ /           |  __ \    (_)     
#     | ' / ___ _   _  | |__) |_ _ _ _ __ 
#     |  < / _ \ | | | |  ___/ _` | | '__|
#     | . \  __/ |_| | | |  | (_| | | |   
#     |_|\_\___|\__, | |_|   \__,_|_|_|   
#                __/ |                    
#               |___/                     

# https://www.terraform.io/docs/providers/tls/r/private_key.html

resource "tls_private_key" "this" {

  algorithm = "RSA"

}

//# 

resource "aws_key_pair" "this" {

  key_name   = var.name
  public_key = tls_private_key.this.public_key_openssh

}

#

//resource "aws_s3_bucket_object" "public-key" {
//
//  depends_on = [tls_private_key.this]
//
//  bucket     = var.bucket_name
//  key        = "/${var.cluster_name}/node-${count.index+1}.pub"
//  #content    = join("", tls_private_key.this[count.index].*.public_key_openssh)
//  content    = tls_private_key.this[count.index].public_key_openssh
//  content_type = "text/*"
//
//  tags = {
//    Name                = "${var.cluster_name}-node-${count.index+1}-public-key"
//    "${var.cluster_id}" = "owned" # Required by Rancher RKE
//  }
//
//}

//resource "null_resource" "delete-public-key" {
//
//  provisioner "local-exec" {
//    command = "rm ${var.folder}/node-${count.index+1}.pub --force || true"
//  }
//
//}

resource "local_file" "public-key" {

  //depends_on = [null_resource.delete-public-key]

  filename = "${var.folder}/${var.name}.pub"
  #content  = join("", tls_private_key.this[count.index].*.public_key_openssh)
  content  = tls_private_key.this.public_key_openssh

}

//resource "aws_s3_bucket_object" "private-key" {
//
//  bucket     = var.bucket_name
//  key        = "/${var.cluster_name}/node-${count.index+1}.pem"
//  #content    = join("", tls_private_key.this[count.index].*.private_key_pem)
//  content    = tls_private_key.this[count.index].private_key_pem
//  content_type = "text/*"
//  #depends_on = [aws_s3_bucket.k8s]
//
//  tags = {
//    Name                = "${var.cluster_name}-node-${count.index+1}-private-key"
//    "${var.cluster_id}" = "owned" # Required by Rancher RKE
//  }
//
//}

//resource "null_resource" "delete-private-key" {
//
//  provisioner "local-exec" {
//    command = "rm ${var.folder}/node-${count.index+1}.pem --force || true"
//  }
//
//}

resource "local_file" "private-key" {

  //depends_on = [null_resource.delete-private-key]

  filename = "${var.folder}/${var.name}.pem"
  #content  = join("", tls_private_key.this[count.index].*.private_key_pem)
  content  = tls_private_key.this.private_key_pem

}