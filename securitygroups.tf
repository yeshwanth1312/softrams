/* Security group for Web server EC2 instances */
resource "aws_security_group" "web-sg" {
  name = "${var.sg_env_prefix}-web-sg"

  tags {
    Name = "${var.sg_env_prefix}-uts-sg"
    Grade = "${var.grade}"
  }

  description = "Open all required ports for Web server instances to communicate with other instances."
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


/* Security group for Web-server ELB */
resource "aws_security_group" "web-elb-sg" {
  name = "${var.sg_env_prefix}-web-elb-sg"

  tags {
    Name = "${var.sg_env_prefix}-web-elb-sg"
    Grade = "${var.grade}"
  }

  description = "Open all required ports for Web server ELB."
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
