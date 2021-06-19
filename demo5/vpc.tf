resource "aws_vpc" "tk-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "tharun-vpc"
  }
}

# Subnets
resource "aws_subnet" "tk-public-1" {
  vpc_id                  = aws_vpc.tk-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1a"

  tags = {
    Name = "tk-public-1"
  }
}

resource "aws_subnet" "tk-public-2" {
  vpc_id                  = aws_vpc.tk-vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1b"

  tags = {
    Name = "tk-public-2"
  }
}

resource "aws_subnet" "tk-public-3" {
  vpc_id                  = aws_vpc.tk-vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-west-1c"

  tags = {
    Name = "tk-public-3"
  }
}

resource "aws_subnet" "tk-private-1" {
  vpc_id                  = aws_vpc.tk-vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1a"

  tags = {
    Name = "tk-private-1"
  }
}

resource "aws_subnet" "tk-private-2" {
  vpc_id                  = aws_vpc.tk-vpc.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1b"

  tags = {
    Name = "tk-private-2"
  }
}

resource "aws_subnet" "tk-private-3" {
  vpc_id                  = aws_vpc.tk-vpc.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-west-1c"

  tags = {
    Name = "tk-private-3"
  }
}

# Internet GW
resource "aws_internet_gateway" "tk-gw" {
  vpc_id = aws_vpc.tk-vpc.id

  tags = {
    Name = "tk-gw"
  }
}

# route tables
resource "aws_route_table" "tk-public" {
  vpc_id = aws_vpc.tk-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tk-gw.id
  }

  tags = {
    Name = "tk-public-1"
  }
}

# route associations public
resource "aws_route_table_association" "tk-public-1-a" {
  subnet_id      = aws_subnet.tk-public-1.id
  route_table_id = aws_route_table.tk-public.id
}

resource "aws_route_table_association" "tk-public-2-a" {
  subnet_id      = aws_subnet.tk-public-2.id
  route_table_id = aws_route_table.tk-public.id
}

resource "aws_route_table_association" "tk-public-3-a" {
  subnet_id      = aws_subnet.tk-public-3.id
  route_table_id = aws_route_table.tk-public.id
}
