resource "aws_instance" "my-machine" {
  # Creation of more than 10 instances creates a violation.
  count = 1005
  ebs_optimized = true
  monitoring = true
  metadata_options {
           http_endpoint = "enabled"
           http_tokens   = "required"
  }
  # All four instances will have the same ami and instance_type
  ami = lookup(var.ec2_ami,var.region) 
  instance_type = var.instance_type # 
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "my-machine-${count.index}"
  }
}