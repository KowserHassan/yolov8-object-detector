resource "aws_vpc" "app_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_subnet" "app_public_subnet" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.app_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.app_vpc.id

  tags = {
    Name        = "${var.project_name}-${var.environment}-igw"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_route_table" "app_public_rt" {
  vpc_id = aws_vpc.app_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_igw.id
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-public-rt"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_route_table_association" "app_publicrtassociation" {
  count = length(aws_subnet.app_public_subnet)

  subnet_id      = aws_subnet.app_public_subnet[count.index].id
  route_table_id = aws_route_table.app_public_rt.id
}


