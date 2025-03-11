variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "us-central1-a"
}

variable "vm_name" {
  description = "Cloud SQL Proxy VM"
  type        = string
  default     = "cloudsql-proxy-vm"
}

variable "db_instance_connection_name" {
  description = "Cloud SQL instance connection name (format: project:region:instance)"
  type        = string
}
variable "google_credentials_file" {
  description = "Path to the Google Cloud service account key file"
  type        = string
}
