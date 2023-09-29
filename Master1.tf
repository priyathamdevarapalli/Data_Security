resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
  encrypted         = false
  tags = {
    Name      = "HelloWorld"
    git_repo  = "Data_Security"
    yor_trace = "c9866987-9a06-41b8-b797-0a052ae1bc4f"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id
  encrypted = false
  tags = {
    Name      = "HelloWorld_snap"
    git_repo  = "Data_Security"
    yor_trace = "eec12e2b-ae48-4622-984c-a333feed7a1a"
  }
}

resource "aws_db_instance" "example" {
  # ... other configuration ...
  storage_encrypted     = false
  allocated_storage     = 50
  max_allocated_storage = 100
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "7513306d-6bd4-45d5-ba78-e5cf1dd32e52"
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
    yor_trace = "a2393c4d-269d-4683-8702-313b52681191"
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
    yor_trace = "67033d7e-9aee-4912-9472-3485ac24e19c"
  }
}

resource "aws_qldb_ledger" "sample-ledger" {
  name                = "sample-ledger"
  permissions_mode    = "STANDARD"
  deletion_protection = false
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "1b6cd597-16fd-43bb-b1a6-3601f1ffadfe"
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
    yor_trace = "80779333-5c0a-43f2-aa1c-7e00ceb3e519"
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

