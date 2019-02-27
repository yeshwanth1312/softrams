/* Rendering the template file for Web Server */
data "template_file" "bootstrap_apache" {
  template = "${file("${path.module}/bootstrap_apache.sh.tpl")}"
  count = "${var.instance_count}"
}

/* Creating instances for hosting a website */
resource "aws_instance" "web-server" {
  ami                     = "${lookup(var.ami_linux, var.region)}"
  instance_type           = "${element(var.instance_types, 0)}"
  subnet_id               = "${element(var.subnet_ids, count.index)}"
  count                   = "${var.instance_count}"
  vpc_security_group_ids  = ["${aws_security_group.web-sg.id}"]
  key_name                = "${var.key_name}"
  associate_public_ip_address = true
  user_data               = "${element(data.template_file.bootstrap_apache.*.rendered, count.index)}"
  tags {
    Name = "${var.env_appender}-web-server${count.index + 1}"
    Grade = "${var.grade}"
    Stack = "webapp"
    "Service Name" = "EC2"
  }
}

/* Creating the load balancer for the webapp instances */
resource "aws_elb" "webserver-elb" {
  name = "${var.env_appender}-frontend-elb"
  subnets = ["${element(var.public_subnets, 0)}", "${element(var.public_subnets, 1)}"]
  security_groups = ["${aws_security_group.web-elb-sg.id}"]
  instances       = ["${aws_instance.web-server.*.id[0]}", "${aws_instance.web-server.*.id[1]}"] #, "${aws_instance.web-server.*.id[2]}"
  depends_on      = ["aws_instance.web-server"]

  listener {
    instance_port       = "80"
    instance_protocol   = "http"
    lb_port             = 80
    lb_protocol         = "http"
  }

  /*listener {
    instance_port      = "80"
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.ssl-cert-arn}"
  }*/

  tags {
    Name = "${var.env_appender}-frontend-elb"
    Grade = "${var.grade}"
    Stack = "webapp"
    "Service Name" = "ELB"
  }
}
