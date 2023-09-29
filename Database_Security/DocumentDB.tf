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
    yor_trace = "8fbcaece-ef28-43c8-9189-f168c1d87198"
  }
}