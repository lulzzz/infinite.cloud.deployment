module "ssh-key" {
  source         = "../ssh-key"
  public_ssh_key = var.public_ssh_key == "" ? "" : var.public_ssh_key
  ssh_filename = "./${var.aks_environment_name}_private_ssh_key"
}

resource "azurerm_kubernetes_cluster" "main" {
  name                    = "${var.name}-aks"
  kubernetes_version      = var.kubernetes_version
  location                = var.location
  resource_group_name     = var.resource_group_name
  node_resource_group     = "MC_${var.name}-aks-rg"
  dns_prefix              = var.prefix
  sku_tier                = var.sku_tier
  private_cluster_enabled = var.private_cluster_enabled

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      # remove any new lines using the replace interpolation function
      key_data = replace(var.public_ssh_key == "" ? module.ssh-key.public_ssh_key : var.public_ssh_key, "\n", "")
    }
  }

  default_node_pool {
    orchestrator_version  = var.orchestrator_version
    name                  = "def${var.nodes_pool_name}"
    node_count            = var.nodes_count
    vm_size               = var.nodes_size
    os_disk_size_gb       = var.os_disk_size_gb
    vnet_subnet_id        = var.vnet_subnet_id
    enable_auto_scaling   = var.enable_auto_scaling
    max_count             = var.enable_auto_scaling ? var.nodes_max_count : null
    min_count             = var.enable_auto_scaling ? var.nodes_min_count : null
    enable_node_public_ip = var.enable_node_public_ip
    availability_zones    = var.nodes_availability_zones
    node_labels           = var.nodes_labels
    type                  = var.nodes_type
    tags                  = merge(var.tags, var.nodes_tags)
    max_pods              = var.nodes_max_pods
  }

  dynamic "service_principal" {
    for_each = var.client_id != "" && var.client_secret != "" ? ["service_principal"] : []
    content {
      client_id     = var.client_id
      client_secret = var.client_secret
    }
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    http_application_routing {
      enabled = var.enable_http_application_routing_add_on
    }

    aci_connector_linux {
      enabled = var.enable_aci_connector_linux
    }
    kube_dashboard {
      enabled = var.enable_kube_dashboard
    }

    azure_policy {
      enabled = var.enable_azure_policy
    }

    oms_agent {
      enabled                    = var.enable_log_analytics_workspace
      log_analytics_workspace_id = var.enable_log_analytics_workspace ? azurerm_log_analytics_workspace.main[0].id : null
    }
  }

  role_based_access_control {
    enabled = var.enable_role_based_access_control

    dynamic "azure_active_directory" {
      for_each = var.enable_role_based_access_control && var.rbac_aad_managed ? ["rbac"] : []
      content {
        managed                = true
        admin_group_object_ids = var.rbac_aad_admin_group_object_ids
      }
    }

    dynamic "azure_active_directory" {
      for_each = var.enable_role_based_access_control && !var.rbac_aad_managed ? ["rbac"] : []
      content {
        managed           = false
        client_app_id     = var.rbac_aad_client_app_id
        server_app_id     = var.rbac_aad_server_app_id
        server_app_secret = var.rbac_aad_server_app_secret
      }
    }
  }

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    dns_service_ip     = var.net_profile_dns_service_ip
    docker_bridge_cidr = var.net_profile_docker_bridge_cidr
    outbound_type      = var.net_profile_outbound_type
    # pod_cidr           = var.net_profile_pod_cidr
    service_cidr = var.net_profile_service_cidr
  }

  tags = var.tags
}


resource "azurerm_log_analytics_workspace" "main" {
  count               = var.enable_log_analytics_workspace ? 1 : 0
  name                = "${var.prefix}-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
  retention_in_days   = var.log_retention_in_days

  tags = var.tags
}

resource "azurerm_log_analytics_solution" "main" {
  count                 = var.enable_log_analytics_workspace ? 1 : 0
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.main[0].id
  workspace_name        = azurerm_log_analytics_workspace.main[0].name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }

  tags = var.tags
}

