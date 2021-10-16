# resource "helm_release" "infinite_admin_agic_prohibited_target" {
#   name       = "infiniteadminprohibittarget"
#   chart      = "./helm_charts/agic_prohibited_target"
#   repository = "agic_prohibited_target"
#   version    = null
#   namespace  = "agic-system"

#   values = [templatefile("./helm_charts/agic_prohibited_target/values/inf_admin_values_template.yaml", {
#     agicProhibitTargetName = "infinite-admin-path-agic-prohibit-target",
#     hostname               = "empty"
#   })]
# }