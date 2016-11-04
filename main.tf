variable "name" {}
variable "environment" {}
variable "region" {}
variable "cidr" {}


provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source      = "github.com/toomanytubes/tf_vpc"

  name               = "${var.name}"
  environment        = "${var.environment}"
  region             = "${var.region}"
  cidr               = "${var.cidr}"
}

module "security_groups" {
  source = "./security_groups"

  vpc_id = "${module.vpc.id}"
}


output "region" {
  value = "${module.vpc.region}"
}
output "cidr" {
  value = "${module.vpc.cidr}"
}
