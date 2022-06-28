
# Creatin 2 EC2
resource "aws_instance" "Test-server1" {
  ami                         = "ami-05a8c865b4de3b127"
  instance_type               = "t2.micro"
  iam_instance_profile        = aws_iam_instance_profile.test_ec2_profile.id
  key_name                    = "au131"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  subnet_id                   = aws_subnet.Test_Public_Sub1.id
  availability_zone           = "eu-west-2a"

  tags = {
    Name = "Test-server1"
  }
}