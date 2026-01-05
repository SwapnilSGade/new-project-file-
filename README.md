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
1) Already created S3 bucket.
   
<img width="1919" height="879" alt="aws s3" src="https://github.com/user-attachments/assets/e5f2b51c-9e66-4238-8bf5-6d5ec72d77a3" />


3) Performed aws Terraform scripts.
   
<img width="1890" height="745" alt="aws" src="https://github.com/user-attachments/assets/dace62a7-58af-4e54-8d6c-7af05dd819a0" />


4) Performed Azure Terraform script.
   
<img width="1900" height="875" alt="azure" src="https://github.com/user-attachments/assets/e14e5a86-f1ac-432d-ac26-ead3b0a288c7" />


5) File automatically backup in Azure blob.
   Uploaded files in AWS S3 bucket, which automatically get backup in Azure Blob Strorage.
   
<img width="1918" height="962" alt="azure blob" src="https://github.com/user-attachments/assets/d236efe0-1629-4968-9469-562f33c571a8" />


6) Logs of transfered file from AWS S3 to Azure Blob Storage.

<img width="768" height="100" alt="Transfer" src="https://github.com/user-attachments/assets/c74a50c5-98bb-4fad-8c7b-d557ae6007d6" />











