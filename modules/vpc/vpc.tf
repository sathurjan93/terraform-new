## VPC

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name    = "Web-app-VPC"
  }
}

## Public Subnet

resource "aws_subnet" "pub_sub1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub_sub1_cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {

    Name    = "public_subnet1"

  }
}


resource "aws_subnet" "pub_sub2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.pub_sub2_cidr_block
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    
    Name    = "public_subnet2"
  }
}

## Private Subnet

resource "aws_subnet" "prv_sub1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.prv_sub1_cidr_block
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    
    Name    = "private_subnet1"
  }
}


resource "aws_subnet" "prv_sub2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.prv_sub2_cidr_block
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    
    Name    = "private_subnet2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    
    Name    = "internet gateway"
  }
}

## Public Route Table

resource "aws_route_table" "pub_sub1_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    
    Name    = "public subnet route table"
  }
}


resource "aws_route_table_association" "internet_for_pub_sub1" {
  route_table_id = aws_route_table.pub_sub1_rt.id
  subnet_id      = aws_subnet.pub_sub1.id
}


resource "aws_route_table_association" "internet_for_pub_sub2" {
  route_table_id = aws_route_table.pub_sub1_rt.id
  subnet_id      = aws_subnet.pub_sub2.id
}

## NAT gateway

resource "aws_eip" "eip_natgw" {
  
}


resource "aws_nat_gateway" "natgateway" {
  
  allocation_id = aws_eip.eip_natgw.id
  subnet_id     = aws_subnet.pub_sub1.id
}


## Private Route Table

resource "aws_route_table" "prv_sub1_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgateway.id
  }
  tags = {
    
    Name    = "private subnet route table"
  }
}


resource "aws_route_table_association" "pri_sub1_to_natgw" {
  route_table_id = aws_route_table.prv_sub1_rt.id
  subnet_id      = aws_subnet.prv_sub1.id
}


resource "aws_route_table_association" "pri_sub2_to_natgw" {
  route_table_id = aws_route_table.prv_sub1_rt.id
  subnet_id      = aws_subnet.prv_sub2.id
}