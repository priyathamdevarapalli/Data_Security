resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
  encrypted         = false
  tags = {
    Name      = "HelloWorld"
    git_repo  = "Data_Security"
    yor_trace = "f527ea55-b6c3-4d08-ac15-00e95df80f71"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id
  encrypted = false
  tags = {
    Name      = "HelloWorld_snap"
    git_repo  = "Data_Security"
    yor_trace = "7b91d149-a85a-452d-9b6f-e3e11b3e8b07"
  }
}

resource "aws_db_instance" "example" {
  # ... other configuration ...
  storage_encrypted     = false
  allocated_storage     = 50
  max_allocated_storage = 100
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "74b04096-c32a-49d7-b769-8795eb1d27a6"
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
    yor_trace = "772b3696-0bc5-44a8-be0a-5b3a21b729c1"
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
    yor_trace = "f7233ae8-de61-424d-adf4-88113ce67cab"
  }
}

resource "aws_qldb_ledger" "sample-ledger" {
  name                = "sample-ledger"
  permissions_mode    = "STANDARD"
  deletion_protection = false
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "15ab2847-77d3-42be-a3f9-c5eb7776c620"
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
    yor_trace = "7813cab8-f503-4e51-a2ee-547d8c5bfb36"
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

