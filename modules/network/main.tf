locals {
  module_tags = merge(
    var.common_tags,
    {
      Module = "network"
    }
  )
}