provider "alicloud" {
  access_key = "LTAI5tLtP8rDQR5B2SkBcrEK"
  secret_key = "5Q06Fx92txwlipNQiUnA9GQ5RQEZPg"
  region     = "me-central-1"
}

resource "alicloud_vpc" "project_vpc" {
  vpc_name    = "project_vpc"
  cidr_block = "10.0.0.0/16"
}

resource "alicloud_security_group" "project" {
  name        = "project-security-group"
  description = "project security group"
  vpc_id      = alicloud_vpc.project_vpc.id
}

resource "alicloud_vswitch" "project_vswitch_1" {
  vpc_id            = alicloud_vpc.project_vpc.id
  cidr_block        = "10.0.0.0/24"
  zone_id = "me-central-1a"
}

resource "alicloud_vswitch" "project_vswitch_2" {
  vpc_id            = alicloud_vpc.project_vpc.id
  cidr_block        = "10.0.2.0/24"
  zone_id  = "me-central-1b"
}
instance_name        = "project-ecs"
  image_id             = "centos_7_9_x64_20G_alibase_20231019.vhd"
  instance_type        = "ecs.g6.large"
  vswitch_id           = alicloud_vswitch.project_vswitch_1.id
  internet_max_bandwidth_out = 10
 instance_charge_type      = "PostPaid"
 security_groups =[alicloud_security_group.project.id]
system_disk_category ="cloud_essd"
}
