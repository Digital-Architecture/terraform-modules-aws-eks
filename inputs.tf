# NTTDATA - DIGITAL ARCHITECTURE
# Create: Marcos Cianci
# Date: Qua 21 Set 2022


variable "name" {

    description = ""
    type        = string
}

variable "region" {

    description = "Set of region in AWS"
    type        = string
}


variable "public_key_name" {

    description = "Set Public Key Access"
    type        = string
}

variable "instance_type" {

    description = "Set type instances"
    type        = string
}

variable "cluster_config_enabled" {

    description = "Enable cluster config"
    type        = bool
    default     = true
}

variable "min_size" {

    description = "Set min size number instaces"
    type        = number
    default     = 3
}

variable "max_size" {

    description = ""
    type        = number
    default     = 6
}

variable "desired_capacity" {

    description = ""
    type        = number
    default     = 3
}

variable "filename" {

    description = ""
    type        = string
}

variable "vpc_id" {

    type = string
}


/*

variable "private_subnet_ids" {

    description = "Set Private Subnet IDs"
    type        = string
}

variable "public_subnet_ids" {

    description = "Set Public Subnet IDs"
    type        = string
}

*/
                      