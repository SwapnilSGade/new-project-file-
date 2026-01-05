#!/bin/bash
apt-get update -y
apt-get install -y unzip cron

# Install rclone
curl https://rclone.org/install.sh | bash

# Configure cron job (every 4 hours)
echo "0 */4 * * * root rclone sync s3:stark-swapnil-media azureblob:s3backup --progress" >> /etc/crontab