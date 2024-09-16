```md
# GCP Tailscale Terraform Setup

This repository contains Terraform configuration files to set up a Google Cloud Platform (GCP) infrastructure with two compute instances:
1. A Tailscale-enabled instance for VPN routing.
2. A basic non-Tailscale instance with SSH access.

## Prerequisites

Before using this repository, ensure you have the following:
1. **Google Cloud Account** with billing enabled.
2. **Tailscale API Key** for VPN setup.
3. **Terraform installed** on your local machine. You can download it [here](https://learn.hashicorp.com/tutorials/terraform/install-cli).
4. **GCP Project** and the necessary permissions (Owner or Editor role).
5. **SSH Key Pair** for SSH access to the instances.

## Features

- **Tailscale VPN**: One of the instances is configured with Tailscale to allow secure private network access.
- **IP Forwarding**: The Tailscale instance has IP forwarding enabled to allow routing through it.
- **SSH Access**: Both instances allow SSH access via your public SSH key.
- **Firewall Rules**: Necessary firewall rules for SSH and Tailscale traffic.

## Terraform Resources

- **VPC Network**: Creates a private network in GCP.
- **Subnetwork**: Subnetwork with a custom CIDR.
- **Firewall Rules**: Allow traffic on the required ports for SSH and Tailscale.
- **Compute Instances**: Two instances, one with Tailscale and one without.

## Project Structure

```bash
├── main.tf              # Main Terraform configuration file
├── variables.tf         # Contains the variable definitions
├── terraform.tfvars     # Defines the values for variables
└── README.md            # Project documentation (this file)
```

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/gcp-tailscale-terraform.git
cd gcp-tailscale-terraform
```

### 2. Configure GCP Authentication

Ensure you have authenticated your Google Cloud account locally using the following command:

```bash
gcloud auth application-default login
```

You should also set the desired project as the default:

```bash
gcloud config set project <your-gcp-project-id>
```

### 3. Set Up Variables

You can set up the variables either by modifying the `terraform.tfvars` file or passing them via the command line. The variables required are:

- **`project_id`**: Your GCP project ID.
- **`region`**: The region in which to create the resources (default: `us-central1`).
- **`ssh_pub_key_path`**: Path to your SSH public key.
- **`ssh_private_key_path`**: Path to your SSH private key.
- **`ssh_username`**: SSH username for connecting to the instances.
- **`tailscale_api_key`**: Your Tailscale API key for enabling Tailscale on one of the instances.

Example `terraform.tfvars` file:

```hcl
project_id          = "your-gcp-project-id"
region              = "us-central1"
ssh_pub_key_path    = "/path/to/your/public/key.pub"
ssh_private_key_path = "/path/to/your/private/key"
ssh_username        = "your-ssh-username"
tailscale_api_key   = "tskey-auth-xxxxxxxxxxxxxxxxxx"
```

### 4. Initialize Terraform

Run the following command to initialize the Terraform working directory and download necessary providers:

```bash
terraform init
```

### 5. Plan the Infrastructure

Run the following command to preview the changes Terraform will make to your GCP project:

```bash
terraform plan
```

### 6. Apply the Configuration

To create the resources defined in the Terraform configuration, run:

```bash
terraform apply
```

This command will prompt for confirmation before creating resources. Type `yes` to confirm.

### 7. Access the Instances

Once Terraform finishes deploying the instances, you can access them via SSH using the private key you provided.

- For the **Tailscale instance**, use the public IP or the Tailscale IP assigned.
  
  ```bash
  ssh -i /path/to/your/private/key your-ssh-username@<instance-public-ip>
  ```

- For the **non-Tailscale instance**, you can access it similarly using the public IP.

## Variables

Here is a breakdown of the variables used in this project:

| Variable               | Description                                  | Default         | Required |
|------------------------|----------------------------------------------|-----------------|----------|
| `project_id`            | GCP Project ID                              | N/A             | Yes      |
| `region`                | GCP Region                                  | `us-central1`   | No       |
| `ssh_pub_key_path`      | Path to SSH public key                      | N/A             | Yes      |
| `ssh_private_key_path`  | Path to SSH private key                     | N/A             | Yes      |
| `ssh_username`          | SSH username for the instance               | N/A             | Yes      |
| `tailscale_api_key`     | Tailscale API key                           | N/A             | Yes      |

## Tearing Down the Infrastructure

To remove all resources created by Terraform, run the following command:

```bash
terraform destroy
```

This will delete all the resources and deallocate any IP addresses associated with them.

## Troubleshooting

- **SSH issues**: Ensure that the SSH key paths in `terraform.tfvars` are correct, and that the GCP firewall allows inbound SSH traffic.
- **Tailscale not working**: Double-check the Tailscale API key and ensure that Tailscale is installed and running on the instance.
  
You can inspect logs by SSHing into the instance and running:

```bash
sudo tailscale status
```

---
