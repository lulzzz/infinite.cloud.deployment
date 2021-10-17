# resource "kubernetes_namespace" "ns" {
#   for_each = { for ns in var.namespaces : ns => ns }

#   metadata {
#     name = each.key
#   }

#   depends_on = [
#     azurerm_kubernetes_cluster.main
#   ]
# }