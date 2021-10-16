variable "chart_version" {
  description = "Helm Chart version of Dapr"
}

variable "values_yaml_file" {
  description = "Values yaml file for the Helm chart"
  type        = any
}

variable "docker_image_version_to_override" {
  description = "Docker Image version to overrider for Dapr control plane. Leave it empty if no override"
}

variable "enable_ha" {
  description = "Enables/Disables High Availablity of the Dapr control plane"
}
