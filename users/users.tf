terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.58"
    }
  }
}

/**
 * Ressource documentation: https://registry.terraform.io/providers/DeviaVir/gsuite/latest/docs/resources/user
 */
resource "gsuite_user" "user" {
  name = {
    family_name = var.user.family_name
    given_name  = var.user.given_name
  }
  primary_email     = var.user.primary_email
  recovery_email    = var.user.recovery_email
  recovery_phone    = var.user.recovery_phone
  org_unit_path     = var.user.org_unit_path
  is_suspended      = var.user.is_suspended
  suspension_reason = var.user.suspension_reason
  update_existing   = true # If omitted or `true` existing GSuite users defined as Terraform resources will be imported by `terraform apply`.
}


