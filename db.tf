resource "aws_db_subnet_group" "db_subnet_group" {
    name = "db_subnet_group"
    subnet_ids = [aws_subnet.private_subnet_1a.id, aws_subnet.private_subnet_2b.id]
    tags = {
        Name = "DevOpsProject_db_subnet_group"
    }
}

/*
resource "aws_db_instance" "db_instance" {
    allocated_storage = 5
    db_name = var.db_name
    engine = "mysql"
    engine_version = "8.0.31"
    instance_class = "db.t2.micro"
    username = var.db_username
    password = var.db_password
    skip_final_snapshot = true
    db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
    tags = {
        Name = "DevOpsProject_db"
    }
}

*/

resource "aws_db_instance" "db" {
    allocated_storage = 5
    instance_class = "db.t2.small"
    engine = "mysql"
    engine_version = "8.0.28"
    username = var.db_username
    password = var.db_password
    skip_final_snapshot = true
}