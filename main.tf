variable "name" {}
variable "environment" {}
variable "region" {}
variable "cidr" {}


provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source      = "github.com/toomanytubes/tf_vpc"

  name        = "${var.name}"
  environment = "${var.environment}"
  region      = "${var.region}"
  cidr        = "${var.cidr}"
}

module "security_groups" {
  source = "./security_groups"

  vpc_id = "${var.module.vpc.id}"
}


output "region" {
  value = "${module.vpc.region}"
}
output "cidr_dev" {
  value = "${module.vpc.cidr}"
}
