# Cloud-Security-Project
🔐 Azure Cloud Security Infrastructure Project
This project demonstrates the deployment and configuration of a secure cloud infrastructure on Microsoft Azure, designed to simulate a real-world enterprise environment with strict network segmentation and access controls.

🏗️ Project Overview
The infrastructure includes a Virtual Network (VNet) with:

🔹 Public Subnet for internet-facing resources (A Virtual Machine)

🔹 Private Subnet for internal resources (Another virtual machine to handle backend tasks)

Each subnet is governed by Network Security Groups (NSGs) and custom route tables, enforcing strict traffic rules and minimizing attack surfaces.

🚀 Key Components
✅ Virtual Network (VNet) with custom IP address space and subnets

✅ NSGs with fine-tuned inbound/outbound rules

✅ Custom Route Tables for traffic flow control

✅ Virtual Machines (Linux) securely deployed in private subnet

✅ Bastion Host for SSH access to private VMs without public IPs

✅ Manual Security Hardening (SSH keys, least privilege, etc.)

🛠️ Skills Demonstrated
Cloud Architecture & Infrastructure-as-a-Service (IaaS)

Network segmentation and firewalling with NSGs

Secure remote access using Azure Bastion

Routing control with custom route tables

Role-based access considerations (IAM planning)

Security-first VM provisioning

🔒 Security Principles Applied
Principle of Least Privilege

Defense in Depth

Segmentation and Isolation

Zero Trust Access (via Bastion, no public IPs)

SSH key authentication over password-based login

📸 Project Diagram & Screenshots
📁 All key infrastructure screenshots and architecture diagrams are available in the /diagrams and /screenshots folders.

📂 Folder Structure
├── Azr-Project-Diagram/   # Network architecture visuals
├── template/              # Azure portal configurations (Bicep)
├── README.md/             # Project overview and documentation

💡 Motivation
This project was built to reinforce hands-on knowledge of cloud security best practices and simulate how enterprises build secure, scalable environments in the cloud. It also serves as a portfolio artifact to demonstrate applied security engineering in Azure.
