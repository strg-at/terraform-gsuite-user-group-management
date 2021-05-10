terraform {
  required_providers {
    gsuite = {
      source  = "DeviaVir/gsuite"
      version = "0.1.58"
    }
  }
}

module "groups" {
  for_each = var.groups
  source   = "./modules/groups"
  providers = {
    gsuite = gsuite
  }
  group = each.value
}

module "groups_in_group" {
  for_each   = var.groups
  depends_on = [module.groups]
  source     = "./modules/groups_in_group"
  providers = {
    gsuite = gsuite
  }
  groups = var.groups
  group  = each.value
}

module "users" {
  for_each   = var.users
  depends_on = [module.groups]
  source     = "./modules/users"
  providers = {
    gsuite = gsuite
  }
  user = each.value
}

module "users_to_groups" {
  for_each   = var.users
  depends_on = [module.users]
  source     = "./modules/users_to_groups"
  providers = {
    gsuite = gsuite
  }
  groups = var.groups
  user   = each.value
}
