#EKS Cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "automata-cluster"
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    subnet_ids = [for subnet in aws_subnet.public_subnet : subnet.id]
  }
}

# EKS Node group
resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "automata-node-group"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = [for subnet in aws_subnet.public_subnet : subnet.id]

  scaling_config {
    desired_size = 1
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.small"]

  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
}
