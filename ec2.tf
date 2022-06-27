# Creatin 2 EC2
resource "aws_instance" "Test-server1" {
  ami                         = "ami-0bb712bfc5b5ce8f9"
  instance_type               = "t2.micro"
  key_name                    = "au131"
  associate_public_ip_address = true  
      
  tags = {
    Name = "Test-server1"
         
  }
}

