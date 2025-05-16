locals {
  app_subnet  = aws_subnet.private_subnets[0]
  data_subnet = aws_subnet.private_subnets[1]
}
resource "aws_network_acl" "public_subnet_nacl" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80 # http
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443 # https
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1021 # ephemeral ports
    to_port    = 65535
  }

  # allow all outbound
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl_association" "public_subnet_nacl_association" {
  subnet_id      = aws_subnet.public_web.id
  network_acl_id = aws_network_acl.public_subnet_nacl.id
}


resource "aws_network_acl" "private_app_subnet_nacl" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.public_subnet_cidr_block
    from_port  = 80 # http
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.public_subnet_cidr_block
    from_port  = 443 # https
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.public_subnet_cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = local.data_subnet.cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.public_subnet_cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = local.data_subnet.cidr_block
    from_port  = 1024
    to_port    = 65535
  }
}

resource "aws_network_acl" "private_data_subnet_nacl" {
  vpc_id = aws_vpc.main.id

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = local.app_subnet.cidr_block
    from_port  = 3306 # mysql
    to_port    = 3306
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = local.app_subnet.cidr_block
    from_port  = 1024
    to_port    = 65535
  }

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = local.app_subnet.cidr_block
    from_port  = 1024
    to_port    = 65535
  }
}

resource "aws_network_acl_association" "private_app_subnet_nacl_association" {
  subnet_id      = local.app_subnet.id
  network_acl_id = aws_network_acl.private_app_subnet_nacl.id
}

resource "aws_network_acl_association" "private_data_subnet_nacl_association" {
  subnet_id      = local.data_subnet.id
  network_acl_id = aws_network_acl.private_data_subnet_nacl.id
}
