data "template_cloudinit_config" "gha_runner_cloudint_config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.gha_runners_script.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = "baz"
  }

  part {
    content_type = "text/x-shellscript"
    content      = "ffbaz"
  }
}

data "template_file" "gha_runners_script" {
  template = file("${path.module}/cloud-init.tmpl")

  vars = {
    gha_runner_app_download_url        = var.gha_runner_app_download_url
    gha_runner_app_downloaded_filename = var.gha_runner_app_downloaded_filename
    gh_org_or_repo_url                 = var.gh_org_or_repo_url
    gha_runner_reg_token_url           = var.gha_runner_reg_token_url
    gh_pat_to_get_runner_reg_token     = var.gh_pat_to_get_runner_reg_token
  }
}
