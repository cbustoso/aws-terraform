variable "eks_cluster_name" {
  description = "Nombre EKS"
  type = string
  default = "labiacbsceks"
}

variable "iam_role_eks" {
  description = "iam_role_eks"
  type        = string
  default = "AWSServiceRoleForAmazonEKS"
}

variable "node_group_name" {
  description = "Nombre NODE Gruop"
  type = string
  default = "labiaccbsnode"
}

variable "endpoint_private_access" {
  type = bool
  default = true
}

variable "endpoint_public_access" {
  type = bool
  default = true
}

variable "eks_cluster_subnet_ids" {
  type = list(string)
    default = [ "subnet-63279142, subnet-13a2d95e, subnet-0674c059" ]
}

variable "private_subnet_ids" {
  type = list(string)
    default = [ "subnet-63279142, subnet-13a2d95e, subnet-0674c059" ]
}

variable "public_subnet_ids" {
  type = list(string)
  default = [ "subnet-13a30875, subnet-0793fe09, subnet-3f8d730e" ]
}

variable "ami_type" {
  type = string 
  default = "AL2_x86_64"
}

variable "disk_size" {
  description = "Disk size in GiB for worker nodes. Defaults to 20."
  type = number
  default = 20
}

variable "instance_types" {
  type = list(string)
  default = ["t3.medium"]
}

variable "pvt_desired_size" {
  default = 1
  type = number
}

variable "pvt_max_size" {
  default = 1
  type = number
}

variable "pvt_min_size" {
  default = 1
  type = number
}

variable "pblc_desired_size" {
  default = 1
  type = number
}

variable "pblc_max_size" {
  default = 1
  type = number
}

variable "pblc_min_size" {
  default = 1
  type = number
}

variable cluster_sg_name {
  type        = string
  default = "LabIacEKSsg"
}

variable nodes_sg_name {
  type        = string
  default = "LabIaCngSG"
}

variable vpc_id {
  type        = string
  default = "vpc-45d51238"
}

