resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-subnet-group"
  subnet_ids = [for subnet in aws_subnet.subnets : subnet.id if try(subnet.tags["Type"], "") == "private"]




  tags = {
    Name = "Redis Subnet Group"
  }
}

resource "aws_elasticache_cluster" "redis_cluster" {
  cluster_id           = "redis-cluster-${terraform.workspace}"
  engine              = "redis"
  node_type           = "cache.t3.micro"
  num_cache_nodes     = 1
  subnet_group_name   = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids  = [aws_security_group.redis_sg.id]

  tags = {
    Name = "Redis-Cluster-${terraform.workspace}"
  }
}


