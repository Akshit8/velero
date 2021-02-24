## GCP service account to use with Terraform and Velero
A service account that has admin access to `google cloud storage` is required for **Terraform** to provision a bucket and for **Velero** to read/write backups to this bucket. <br>
Open [google cloud console](https://console.cloud.google.com) and navigate to `IAM & Admin`>`Service accounts`
- Create a new service account.
- Give `cloud storage admin` permission to this account.
- Create a key for this account in `json` format and download it.
- Rename it to `credentials.json` and place it inside this folder.
