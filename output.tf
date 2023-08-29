output "instance_id" {
  value       = aws_lightsail_instance.lightsail_instance.id
  description = "this is the lightsail instance id"
}
#print the url of the lightsail server
output "ssh_connection_command" {
  value     = join ("", ["ssh -i myKey.pem ubuntu@", aws_lightsail_instance.lightsail_instance.public_ip_address])
}