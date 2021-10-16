# resource "kubernetes_namespace" "k8s_namespace" {
#   for_each = var.environments

#   metadata {
#     name = each.key
#   }

#   depends_on = [module.aks]
# }
