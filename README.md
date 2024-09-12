#Tailscale deployment of Subnet Router on GCP using Terraform

This project sets up a Tailscale lab environment on Google Cloud Platform (GCP) using Terraform.

## Prerequisites

- GCP account with Compute Engine API
- Terraform installed
- Google Cloud SDK installed
- Git installed
- Tailscale account and auth key (reusable)

## Deployment Instructions

1. Clone this repository
2. Set up GCP credentials
3. Update `variables.tf` with your specific values
4. Run `terraform init`
5. Run `terraform plan`
6. Run `terraform apply`

## Project Structure

- `main.tf`: Main Terraform configuration
- `variables.tf`: Variable definitions
- `outputs.tf`: Output definitions (Optional, it helped me SSH directly to the Public IP for troubleshooting)
- `scripts/setup_tailscale.sh`: Script to set up Tailscale on the instance on boot

## Notes

- Main.tf creates a VPC, subnet, firewall rule, and a compute instance
- Main.tf references a script file that executes on startup which 
	- Downloads the tailscale client and installs it on the VM
	- Sets the required IP forwarding rule 
	- logs into your tailscale tenant using the API key (Use re-usable keys, don't be me!)
- Subnet routing is enabled for the 10.0.0.0/24 network
- SSH access is enabled through Tailscale

Reference Links:
Subnet Router: https://tailscale.com/kb/1019/subnets
SSH via Tailscale: https://tailscale.com/kb/1009/protect-ssh-servers#getting-started-with-ssh-over-tailscale
