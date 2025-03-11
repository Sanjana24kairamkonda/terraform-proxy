output "cloudsql_proxy_vm_ip" {
  value = google_compute_instance.cloudsql_proxy_vm.network_interface[0].access_config[0].nat_ip
}

output "sql_connection_command" {
  value = "psql -h ${google_compute_instance.cloudsql_proxy_vm.network_interface[0].access_config[0].nat_ip} -U admin -d mydatabase"
}
