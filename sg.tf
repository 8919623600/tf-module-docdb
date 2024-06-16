resource "aws_security_group" "docdb_sg" {
  description = "docdb_sg created from terraform"
  vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID

tags = {
    Name = "roboshop-${var.ENV}-docdb-sg"
  }
  
 ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    # cidr_blocks     = [data.terraform_remote_state.vpc.outputs.VPC_ID, data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR]
    cidr_blocks     = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]

  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }


}