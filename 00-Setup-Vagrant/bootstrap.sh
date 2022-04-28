#!/bin/bash

# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.31.0.100 terraform.example.com terraform
172.31.0.101 worker1.example.com worker1
172.31.0.102 worker2.example.com worker2
EOF


# Install Terraform
echo "[TASK 2] Install Base Packages"
apt-get update >/dev/null 2>&1
apt-get install -y  jq wget unzip  >/dev/null 2>&1

# Download Terraform
wget https://releases.hashicorp.com/terraform/0.12.28/terraform_0.12.28_linux_amd64.zip -P /root/ >/dev/null 2>&1
unzip /root/terraform_0.11.12_linux_amd64.zip
mv terraform /usr/bin/
chmod +x /usr/bin/terraform
terraform --version


# Enable ssh password authentication
echo "[TASK 3] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc

