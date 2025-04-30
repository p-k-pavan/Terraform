##########################
# Local Variables
##########################
locals {
  cluster_name         = "EKS-ClusterTWS"
  node_group_name      = "Node-TWS"
  cluster_role_name    = "eks-cluster-role-terraform"
  node_group_role_name = "eks-node-group"
}