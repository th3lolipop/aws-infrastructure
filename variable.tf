variable "name" {
    type = string
    description = "AWS VPC NAME"
}

variable "cidr" {
    default = "10.0.0.0/16"
	type = string
	description = "VPC CIDR BLOCK"
    
}

vairable "azs" {
	type = list(string)
	default = ["ap-southeast-1a", "ap-southeast-1b"]
	description = "List of Availability Zones"
}

variable "private" {
	type = list(string)
	default = ["10.0.1.0/24", "10.0.2.0/24"]
	description = "Private Subnet CIDR"
}

variable "public" {
	type = list(string)
	default = ["10.0.3.0/24", "10.0.4.0/24"]
	description = "Public Subnet CIDR"
}

variable "aws" {
	type = object({
    access_key = string 
    secret_key = string
    region = string
  })
	description = "The AWS credential"
}
