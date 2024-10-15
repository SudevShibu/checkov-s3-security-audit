# Checkov S3 Security Audit

This project demonstrates a security audit of an AWS S3 bucket using Checkov, a static code analysis tool for Infrastructure as Code (IaC).

## Overview

This repository contains Terraform code to provision an AWS S3 bucket with various security configurations, and the results of a security scan using Checkov to validate the security posture of the bucket.

### Key Security Features Implemented:
- Server-side encryption (SSE) using AWS KMS
- Access logging enabled
- Lifecycle rules to transition data to Glacier
- Public access restrictions

### Failed Checks:
- S3 bucket event notifications are not enabled.
- Cross-region replication is not configured.

## Getting Started

### Prerequisites
- Install [Terraform](https://www.terraform.io/downloads.html)
- Install [Checkov](https://www.checkov.io/)

### How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/checkov-s3-security-audit.git
   cd checkov-s3-security-audit

2.Initialize and apply the Terraform configuration:
 terraform init
 terraform apply

3.Run Checkov to scan the Terraform configuration:
 checkov -f main.tf

4.Review the security audit results in checkov_results.txt.

##Scan Results
Here is a summary of the Checkov scan results:

Passed Checks: 13
Failed Checks: 2
You can find the full scan report in the file checkov_results.txt.

##Contribution
This project can be enhanced by addressing the failed checks, such as:

Enabling S3 bucket event notifications.
Configuring cross-region replication for the S3 bucket.
Feel free to fork the project and contribute any improvements!

