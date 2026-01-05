## Overview
This project provisions a secure, automated cross-cloud backup solution using **Terraform**.  
It syncs data from an existing **AWS S3 bucket** to **Azure Blob Storage** every 4 hours, ensuring redundancy, reliability, and compliance with security best practices.

##  Objectives
- Maintain a **cross-cloud backup** of AWS S3 data in Azure Blob.
- Ensure **automation** and **scheduling** without impacting the source application.
- Follow **Terraform best practices** with modular code, variables, and outputs.
- Enforce **security principles**: least privilege, no hardcoded credentials, encryption at rest.

### 1. AWS (Source)
- Uses an **existing S3 bucket** (no new bucket creation).
- IAM Role & Policy:
  - Read-only access to the S3 bucket.
  - Follows **least-privilege principle**.
- Authentication handled via **IAM roles** (no static credentials).

### 2. Azure (Destination)
- Terraform provisions:
  - **Resource Group**
  - **Storage Account** (with encryption at rest enabled)
  - **Blob Container** for backups
- Access restricted to **private endpoints**.

### 3. Backup Mechanism
- **Approach:**  
  An **EC2 instance** (AWS) or **Azure VM** runs a sync script using `azcopy` or `rclone`.  
  - `rclone` supports cross-cloud sync between S3 and Blob.  
  - Chosen for **simplicity, reliability, and cross-cloud compatibility**.
- Sync runs every 4 hours, copying new/modified files only.
 
 ### 4. Scheduling
- **Cron job** configured on the VM/EC2 instance:
  ```bash
  0 */4 * * * rclone sync s3://<source-bucket> azure:<storage-account>/<container> --progress


Here are the images -

![image alt] (https://github.com/SwapnilSGade/new-project-file-/blob/48e662515b97828716c5616b892ebd2cead71159/aws%20s3.png)

