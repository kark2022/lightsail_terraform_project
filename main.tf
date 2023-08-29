resource "aws_lightsail_instance" "lightsail_instance" {
  name          = "Utrains_devops"
  availability_zone = "us-east-1a"
  blueprint_id  = "ubuntu_20_04"
  bundle_id     = "nano_1_0"
 # key_pair_name = aws_lightsail_key_pair.key_pair.name 
  tags = {
    team = "utrains devops"
    env  = "dev" 
  }
}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_lightsail_key_pair" "key_pair" {
  name   = "myKey"
  public_key = tls_private_key.pk.public_key_openssh
}

resource "local_file" "local_key_pair" {
  filename = "myKey.pem"
  file_permission = "0400"
  content = tls_private_key.pk.private_key_pem
}