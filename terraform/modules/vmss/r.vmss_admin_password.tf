
resource "random_password" "vmss_password" {
  length  = 32
  special = true
}