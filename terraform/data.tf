resource "aws_default_vpc" "default" {

}

data "aws_subnets" "default_ec2" {
    filter {
        name = "vpc-id"
        values = [aws_default_vpc.default.id]
    }
}