locals {
  jobs = flatten([
    for env_key, env in var.environments : [
      for job_key, job in env.cronjobs : {
        env_key = env_key,
        key     = job_key,
        job     = job
      }
    ]
  ])
}

resource "helm_release" "cronjob_helm_rel" {

  for_each = { for job in local.jobs : "${job.env_key}-${job.key}" => job }

  name             = each.value.job.name
  chart            = "./helm_charts/cronjob"
  repository       = "crontab"
  version          = null
  namespace        = each.value.env_key
  create_namespace = true

  set {
    name  = "cronExpression"
    value = each.value.job.cron_expression
  }

  set {
    name  = "dapr.appId"
    value = each.value.job.name
  }

  set {
    name  = "image.repository"
    value = each.value.job.image_repository
  }

  set {
    name  = "image.tag"
    value = each.value.job.image_tag
  }

  set {
    name  = "image.entrypoint"
    value = each.value.job.docker_entrypoint
  }

  depends_on = [module.aks]
}
