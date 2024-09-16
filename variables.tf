# variables.tf

# GCP Project ID
variable "project_id" {
  description = "The ID of the GCP project."
  type        = string
}

# GCP Region
variable "region" {
  description = "The GCP region for the resources."
  type        = string
  default     = "us-central1"
}

# SSH Public Key Path
variable "ssh_pub_key_path" {
  description = "The path to the SSH public key file."
  type        = string
}

# SSH Private Key Path
variable "ssh_private_key_path" {
  description = "The path to the SSH private key file."
  type        = string
}

# SSH Username
variable "ssh_username" {
  description = "The SSH username to use for the instance."
  type        = string
}

# Tailscale API Key
variable "tailscale_api_key" {
  description = "The Tailscale API key for authentication."
  type        = string
  sensitive   = true
}

