# new-project-file-
# Cross-Cloud Backup (AWS S3 → Azure Blob)

## Architecture
- AWS S3 bucket (existing) as source.
- Azure Blob Storage as destination.
- EC2 instance with IAM role + rclone for sync.
- Cron job runs every 4 hours.

## Security
- IAM role with least privilege.
- Azure storage with private access + encryption.
- No hardcoded credentials.

## Scheduling
- Cron job on EC2 runs `rclone sync` every 4 hours.

## Assumptions
- Existing S3 bucket already populated.
- Azure subscription available.
- rclone chosen for simplicity and reliability.