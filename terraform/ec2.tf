resource "aws_instance" "web-1" {
    ami = var.imagename
    availability_zone = "ap-south-1b"
    instance_type = "t2.micro"
    key_name = "chefkeypair"
    subnet_id = "${aws_subnet.subnet1-public.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]
    associate_public_ip_address = true
    tags ={
        Name = "test-1"
        Env = "prod"
    }
}