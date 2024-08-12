# variables for network

# AWS Region
variable "region" {
  description = "The AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"  # Change this if you want to deploy in a different region
}

# VPC CIDR Block
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

# Public Subnet CIDR Blocks
variable "public_subnet_1_cidr" {
  description = "CIDR block for the first public subnet"
  type        = string
  default     = "10.1.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = "10.1.2.0/24"
}

variable "public_subnet_3_cidr" {
  description = "CIDR block for the third public subnet"
  type        = string
  default     = "10.1.3.0/24"
}
variable "public_subnet_4_cidr" {
  description = "CIDR block for the fourth public subnet"
  type        = string
  default     = "10.1.4.0/24"
}

# Private Subnet CIDR Blocks
variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
  type        = string
  default     = "10.1.5.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.1.6.0/24"
}

# Availability Zones
variable "availability_zone_1" {
  description = "Availability Zone for the first subnet"
  type        = string
  default     = "us-east-1a"  # Change based on your region
}

variable "availability_zone_2" {
  description = "Availability Zone for the second subnet"
  type        = string
  default     = "us-east-1b"  # Change based on your region
}

variable "availability_zone_3" {
  description = "Availability Zone for the third subnet"
  type        = string
  default     = "us-east-1c"  # Change based on your region
}

variable "availability_zone_4" {
  description = "Availability Zone for the fouth subnet"
  type        = string
  default     = "us-east-1d"  # Change based on your region
}
