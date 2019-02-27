output "web_ids" {
  value = "${aws_instance.web-server.*.id}"
}

output "web_int_ips" {
  value = "${aws_instance.web-server.*.private_ip}"
}

output "web_pub_ips" {
  value = "${aws_instance.web-server.*.public_ip}"
}

output "elb_url" {
  value = "${aws_elb.webserver-elb.dns_name}"
}
