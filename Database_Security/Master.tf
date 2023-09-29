resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
  encrypted         = false
  tags = {
    Name      = "HelloWorld"
    git_repo  = "Data_Security"
    yor_trace = "e6a207d5-7682-46bc-9d41-f27b8478a931"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id
  encrypted = false
  tags = {
    Name      = "HelloWorld_snap"
    git_repo  = "Data_Security"
    yor_trace = "862640a0-69f1-4da4-a8a9-a69c50a4f168"
  }
}

resource "aws_db_instance" "example" {
  # ... other configuration ...
  storage_encrypted     = false
  allocated_storage     = 50
  max_allocated_storage = 100
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "42aa32f8-6633-400d-ab35-279149b312c5"
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
    yor_trace = "b0c7ccd2-b356-4259-88e8-16643e485ad2"
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
    yor_trace = "b2f8042a-ab51-44e8-875d-94432c99a351"
  }
}

resource "aws_qldb_ledger" "sample-ledger" {
  name                = "sample-ledger"
  permissions_mode    = "STANDARD"
  deletion_protection = false
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "27a9989d-8ade-442a-9f05-474bf7cdc5ca"
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
    yor_trace = "11ca5d65-7f51-4819-bb83-d8f7d0907532"
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

