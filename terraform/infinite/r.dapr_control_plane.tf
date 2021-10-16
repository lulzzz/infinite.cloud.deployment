module "dapr_control_plane" {
  source = "../modules/dapr_control_plane"

  chart_version                    = var.helm_dapr_chart_version
  values_yaml_file                 = file("../modules/dapr_control_plane/helm_values.yml")
  docker_image_version_to_override = var.helm_dapr_docker_image_version_to_override
  enable_ha                        = var.helm_dapr_enable_ha

  depends_on = [module.aks]
}