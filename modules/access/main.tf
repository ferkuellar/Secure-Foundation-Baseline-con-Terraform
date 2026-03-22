locals {
  module_tags = merge(
    var.common_tags,
    {
      Module = "access"
    }
  )
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "admin_host" {
  name        = "${var.name_prefix}-sg-admin-host"
  description = "Admin host security group with no inbound SSH"
  vpc_id      = var.vpc_id

  tags = merge(
    local.module_tags,
    {
      Name = "${var.name_prefix}-sg-admin-host"
    }
  )
}

resource "aws_vpc_security_group_egress_rule" "https_out" {
  security_group_id = aws_security_group.admin_host.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443

  description = "Allow outbound HTTPS for SSM and package access"
}

resource "aws_vpc_security_group_egress_rule" "dns_udp_out" {
  security_group_id = aws_security_group.admin_host.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "udp"
  from_port         = 53
  to_port           = 53

  description = "Allow outbound DNS UDP"
}

resource "aws_vpc_security_group_egress_rule" "dns_tcp_out" {
  security_group_id = aws_security_group.admin_host.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 53
  to_port           = 53

  description = "Allow outbound DNS TCP"
}

resource "aws_iam_role" "ssm_instance_role" {
  name = "${var.name_prefix}-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(
    local.module_tags,
    {
      Name = "${var.name_prefix}-ec2-ssm-role"
    }
  )
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ssm_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "${var.name_prefix}-ec2-ssm-profile"
  role = aws_iam_role.ssm_instance_role.name

  tags = merge(
    local.module_tags,
    {
      Name = "${var.name_prefix}-ec2-ssm-profile"
    }
  )
}

resource "aws_instance" "admin_host" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.admin_instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [aws_security_group.admin_host.id]
  iam_instance_profile        = aws_iam_instance_profile.ssm_instance_profile.name
  associate_public_ip_address = false

  metadata_options {
    http_tokens = "required"
  }

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = merge(
    local.module_tags,
    {
      Name = "${var.name_prefix}-admin-host"
      Role = "admin"
    }
  )
}