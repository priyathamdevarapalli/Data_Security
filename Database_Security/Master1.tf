resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
  encrypted         = false
  tags = {
    Name      = "HelloWorld"
    git_repo  = "Data_Security"
    yor_trace = "ed752689-8878-4fb9-8e01-e5194853621f"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id
  encrypted = false
  tags = {
    Name      = "HelloWorld_snap"
    git_repo  = "Data_Security"
    yor_trace = "3b2a7443-3fb6-444e-9c3d-4bf9bc36ad09"
  }
}

resource "aws_db_instance" "example" {
  # ... other configuration ...
  storage_encrypted     = false
  allocated_storage     = 50
  max_allocated_storage = 100
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "4b04a665-486b-4003-9742-5c2b397b7179"
  }
}

resource "aws_rds_cluster_instance" "example" {
  cluster_identifier = aws_rds_cluster.example.id
  instance_class     = "db.serverless"
  storage_encrypted  = false
  engine             = aws_rds_cluster.example.engine
  engine_version     = aws_rds_cluster.example.engine_version
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "907fc908-aedc-4be3-b4c0-966a106b8ae4"
  }
}

resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = "neptune-cluster-demo"
  engine                              = "neptune"
  backup_retention_period             = 5
  storage_encrypted                   = false
  deletion_protection                 = false
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = true
  apply_immediately                   = true
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "0b85b7c9-50d8-4498-b9f7-07c2646a9b97"
  }
}

resource "aws_qldb_ledger" "sample-ledger" {
  name                = "sample-ledger"
  permissions_mode    = "STANDARD"
  deletion_protection = false
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "0358b0b6-819c-4ed1-97ea-a983ee572095"
  }
}

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = "docdb"
  master_username         = "foo"
  master_password         = "mustbeeightchars"
  backup_retention_period = 5
  storage_encrypted       = false
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "9bec66f1-89a8-4a53-b74f-5a3e0dbf71c7"
  }
}

resource "aws_memorydb_cluster" "example" {
  acl_name                 = "open-access"
  name                     = "my-cluster"
  node_type                = "db.t4g.small"
  num_shards               = 2
  tls_enabled              = false
  security_group_ids       = [aws_security_group.example.id]
  snapshot_retention_limit = 7
  subnet_group_name        = aws_memorydb_subnet_group.example.id
}

