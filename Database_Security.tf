resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 50
  encrypted         = false
  tags = {
    Name      = "HelloWorld"
    git_repo  = "Data_Security"
    yor_trace = "9d3de05c-c37c-4594-9eb8-0466b121bba4"
  }
}

resource "aws_ebs_snapshot" "example_snapshot" {
  volume_id = aws_ebs_volume.example.id
  encrypted = false
  tags = {
    Name      = "HelloWorld_snap"
    git_repo  = "Data_Security"
    yor_trace = "d7636adf-48c7-4165-8191-83d03925af12"
  }
}

resource "aws_db_instance" "example" {
  # ... other configuration ...
  storage_encrypted     = false
  allocated_storage     = 50
  max_allocated_storage = 100
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "b5b30ec7-b71a-4fc2-91c1-5a3bbce5a4db"
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
    yor_trace = "06900532-d1f6-467d-8001-fd2955c896df"
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
    yor_trace = "d417a090-1b7c-4703-8e41-689b29645753"
  }
}

resource "aws_qldb_ledger" "sample-ledger" {
  name                = "sample-ledger"
  permissions_mode    = "STANDARD"
  deletion_protection = false
  tags = {
    git_repo  = "Data_Security"
    yor_trace = "cd10593f-0629-402c-ace4-bfd3e3fb7d4a"
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
    yor_trace = "8eaa07bd-d85c-4b1d-8267-481b9553458e"
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

