﻿#       ____        _               _       
#      / __ \      | |             | |      
#     | |  | |_   _| |_ _ __  _   _| |_ ___
#     | |  | | | | | __| '_ \| | | | __/ __|
#     | |__| | |_| | |_| |_) | |_| | |_\__ \
#      \____/ \__,_|\__| .__/ \__,_|\__|___/
#                      | |                  
#                      |_|

output "key_pair" {
  value = aws_key_pair.this
}

output "key_name" {
  value = aws_key_pair.this.key_name
}

output "private_key_pem" {
  value = tls_private_key.this.private_key_pem
}