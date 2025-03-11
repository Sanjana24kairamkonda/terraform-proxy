/*resource "google_service_account" "cloud_sql_proxy_sa" {
  account_id   = "cloud-sql-proxy-sa"
  display_name = "Cloud SQL Proxy Service Account"
}

resource "google_project_iam_member" "cloud_sql_proxy_role" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.cloud_sql_proxy_sa.email}"
}*/

resource "google_compute_instance" "cloudsql_proxy_vm" {
  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata_startup_script = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt install wget -y

# Download and install Cloud SQL Proxy
wget https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.9.0/cloud-sql-proxy.linux.amd64
chmod +x cloud-sql-proxy.linux.amd64
mv cloud-sql-proxy.linux.amd64 /usr/local/bin/cloud_sql_proxy

# Start the Cloud SQL Proxy
/usr/local/bin/cloud_sql_proxy --address=0.0.0.0 --port=5432 --instances=${var.db_instance_connection_name} &
EOF

  service_account {
    email  = google_service_account.cloud_sql_proxy_sa.email
    scopes = ["cloud-platform"]
  }
}
