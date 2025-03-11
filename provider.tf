provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
  credentials = file(var.google_credentials_file)  # Use the file directly
}
