variable "name" {}
variable "environment" {}
variable "region" {}
variable "cidr" {}


provider "aws" {
  region = "${var.region}"
}

module "vpc" {
  source      = "github.com/toomanytubes/tf_vpc"

  name        = "rancher"
  environment = "dev"
  region      = "${var.region}"
  cidr        = "10.42.0.0/16"
}

module "security_groups" {
  source      = "./security_groups"

  vpc_id = "${module.vcp_dev.id}"

}


output "region" {
  value = "${module.vpc_dev.region}"
}
output "cidr_dev" {
  value = "${module.vpc_dev.cidr}"
}
