# Creating networking for the project 
resource "aws_vpc" "Prod_rock_VPC" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Prod-rock-VPC"
  }

}

# Public Subnet 1 
resource "aws_subnet" "Test_Public_Sub1" {
  vpc_id            = aws_vpc.Prod_rock_VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Test_Public_Sub1"
  }

}


# Public Route table 
resource "aws_route_table" "Test_pub_route_table" {
  vpc_id = aws_vpc.Prod_rock_VPC.id

  tags = {
    Name = "Test_pub_route_table"
  }

}

# Public subnets associate with the public route table 
resource "aws_route_table_association" "public_sub1_route_assoc" {
  subnet_id      = aws_subnet.Test_Public_Sub1.id
  route_table_id = aws_route_table.Test_pub_route_table.id
}

# Internet Gateway 
resource "aws_internet_gateway" "Test_igw" {
  vpc_id = aws_vpc.Prod_rock_VPC.id

  tags = {
    Name = "Test-igw"
  }

}

# Internet gateway association with the public route table 
resource "aws_route" "IGW_Pub_route_assoc" {
  route_table_id         = aws_route_table.Test_pub_route_table.id
  gateway_id             = aws_internet_gateway.Test_igw.id
  destination_cidr_block = "0.0.0.0/0"
}
