resource "google_compute_firewall" "allow_sql_proxy" {
  name    = "allow-sql-proxy"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5432", "3306"]  # Change depending on MySQL/PostgreSQL
  }

  source_ranges = ["0.0.0.0/0"]  # Adjust for security
}
