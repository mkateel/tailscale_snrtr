#!/bin/bash


# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Enable IP forwarding
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

# Start Tailscale with subnet routing and SSH enabled
sudo tailscale up --authkey=${tailscale_auth_key} --advertise-routes=10.0.0.0/24 --ssh
