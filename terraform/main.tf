terraform {
  required_providers {
    apstra = {
      source = "Juniper/apstra"
      version = ">= 0.98.0"
    }
  }
}

provider "apstra" {
  url = "https://192.168.122.35"
  tls_validation_disabled = true
}
