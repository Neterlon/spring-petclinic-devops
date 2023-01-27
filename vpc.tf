#
# VPC
#

resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "DevOpsProject_vpc"
    }
}

#
# Subnets
#

resource "aws_subnet" "public_subnet_1a" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "${var.aws_region}a"
    tags = {
        Name = "DevOpsProject_pub_sub_1a"
    }
}

resource "aws_subnet" "public_subnet_2b" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "${var.aws_region}a"
    tags = {
        Name = "DevOpsProject_pub_sub_2b"
    }
}

resource "aws_subnet" "private_subnet_1a" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "${var.aws_region}a"
    tags = {
        Name = "DevOpsProject_priv_sub_1a"
    }
}

resource "aws_subnet" "private_subnet_2b" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "${var.aws_region}b"
    tags = {
        Name = "DevOpsProject_priv_sub_2b"
    }
}

#
# Internet Gateway
#

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
        Name = "DevOpsProject_gw"
    }
}

#
# Route tables
#

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
        Name = "DevOpsProject_public_rt"
    }
}

#
# Route tables associations
#

resource "aws_route_table_association" "pub_sub_1a_rt_association" {
    subnet_id = aws_subnet.public_subnet_1a.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "pub_sub_2b_rt_association" {
    subnet_id = aws_subnet.public_subnet_2b.id
    route_table_id = aws_route_table.public_rt.id
}
