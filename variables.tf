variable "aws_region" {
    type = string
    description = "The region in which the infrastructure will be deployed"
    default = "default"
}

variable "project_default_tags" {
    type = map(string)
    default     = {
        Environment = "default"
        Owner       = "default"
        Project     = "default"
    }
}

variable "db_name" {
    default = "default"
    description = "Database name"
    sensitive = true
}

variable "db_username" {
    default = "default"
    description = "Database username"
    sensitive = true
}

variable "db_password" {
    default = "default"
    description = "Database password"
    sensitive = true
}