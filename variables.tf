variable "project_id" {
  description = "GCP Project ID"
}

variable "region" {
  description = "GCP region"
  default     = "us-central1"
}

variable "ssh_username" {
  description = "SSH username"
}

variable "ssh_pub_key_path" {
  description = "Path to public SSH key"
}

variable "tailscale_auth_key" {
  description = "Tailscale authentication key"
}
