#     ____        _               _       
#    / __ \      | |             | |      
#   | |  | |_   _| |_ _ __  _   _| |_ ___ 
#   | |  | | | | | __| '_ \| | | | __/ __|
#   | |__| | |_| | |_| |_) | |_| | |_\__ \
#    \____/ \__,_|\__| .__/ \__,_|\__|___/
#                    | |                  
#                    |_|                  

output "key_pair" {
  value = module.keys.key_pair
}

output "key_name" {
  value = module.keys.key_name
}

output "public_key" {
  value = module.keys.public_key
}

output "private_key" {
  value = module.keys.private_key
}