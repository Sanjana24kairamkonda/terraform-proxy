provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone

  credentials = jsondecode(base64decode(var.gcp_sa_key))
}
