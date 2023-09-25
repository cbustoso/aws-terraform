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
  description = "Name of the Node Group"
  type = string
  default = "labiaccbsnode"
}

variable "endpoint_private_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

variable "endpoint_public_access" {
  type = bool
  default = true
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
}

variable "eks_cluster_subnet_ids" {
  type = list(string)
  description = "List of subnet IDs. Must be in at least two different availability zones. Amazon EKS creates cross-account elastic network interfaces in these subnets to allow communication between your worker nodes and the Kubernetes control plane."
  default = [ "subnet-63279142, subnet-13a2d95e, subnet-0674c059" ]
}

variable "private_subnet_ids" {
  type = list(string)
  description = "List of private subnet IDs."
  default = [ "subnet-63279142, subnet-13a2d95e, subnet-0674c059" ]
}

variable "public_subnet_ids" {
  type = list(string)
  description = "List of public subnet IDs."
  default = [ "subnet-13a30875, subnet-0793fe09, subnet-3f8d730e" ]
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Defaults to AL2_x86_64. Valid values: AL2_x86_64, AL2_x86_64_GPU."
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
  description = "Set of instance types associated with the EKS Node Group."
}

variable "pvt_desired_size" {
  description = "Desired number of worker nodes in private subnet"
  default = 1
  type = number
}

variable "pvt_max_size" {
  description = "Maximum number of worker nodes in private subnet."
  default = 1
  type = number
}

variable "pvt_min_size" {
  description = "Minimum number of worker nodes in private subnet."
  default = 1
  type = number
}

variable "pblc_desired_size" {
  description = "Desired number of worker nodes in public subnet"
  default = 1
  type = number
}

variable "pblc_max_size" {
  description = "Maximum number of worker nodes in public subnet."
  default = 1
  type = number
}

variable "pblc_min_size" {
  description = "Minimum number of worker nodes in public subnet."
  default = 1
  type = number
}

variable cluster_sg_name {
  description = "Name of the EKS cluster Security Group"
  type        = string
  default = "LabIacEKSsg"
}

variable nodes_sg_name {
  description = "Name of the EKS node group Security Group"
  type        = string
  default = "LabIaCngSG"
}

variable vpc_id {
  description = "VPC ID from which belongs the subnets"
  type        = string
  default = "vpc-45d51238"
}

