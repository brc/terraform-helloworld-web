# Variables populated by root Terragrunt configuration.
variable "app_name" {}

module "lb" {
  source = "github.com/invsblduck/terraform-module-google-lb//lb?ref=v0.0.1"

  lb_name          = "lb-${var.app_name}"
  lb_addr_name     = "addr-${var.app_name}-fe"
  lb_tls_cert_name = "ssl-${var.app_name}"
  lb_tls_secret    = "lb-tls-key"
  lb_backend_name  = "be-${var.app_name}"
  lb_proxy_name    = "proxy-${var.app_name}"
  lb_frontend_name = "fe-${var.app_name}"
  lb_neg_list      = [
    {
      name    = "neg-${var.app_name}-uswest"
      region  = "us-west2"
      run_svc = "${var.app_name}-prod"
    },
    {
      name    = "neg-${var.app_name}-useast"
      region  = "us-east4"
      run_svc = "${var.app_name}-prod"
    },
  ]
}
