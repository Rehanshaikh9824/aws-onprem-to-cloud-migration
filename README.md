# aws-on-premise-to-cloud-migration

## About This Project
This project shows how a small on-premise application is migrated to AWS Cloud.
The migration is done in * AWS *.

The application was originally running on a local (on-premise) server and then
moved to AWS using a *Lift-and-Shift* migration approach.

---

## What I Did in This Project
- Created AWS infrastructure
- Migrated application from on-premise server to AWS
- Deployed application on EC2
- Migrated database to Amazon RDS
- Implemented security, monitoring, and automation

---

## AWS Services Used
- *EC2* – to host the application  
- *S3* – to store application files  
- *RDS (MySQL)* – for database  
- *VPC* – for secure networking  
- *IAM* – for access management  
- *CloudWatch* – for monitoring  
- *Terraform* – for infrastructure automation  

---

## Architecture
- User accesses the application hosted on EC2
- EC2 runs inside a secure VPC
- Application files are stored in S3
- Database is managed using Amazon RDS
- Application health and logs are monitored using CloudWatch

---

## Migration Steps
1. Prepared the on-premise application
2. Created AWS account and IAM user
3. Selected *Region*
4. Set up VPC and security groups
5. Launched EC2 instance
6. Copied application files to S3
7. Migrated database to RDS
8. Tested application after migration
9. Automated infrastructure using Terraform

---

## Automation
Terraform was used to create AWS resources like EC2.
This reduced manual work and ensured consistent infrastructure setup.

---

## Result / Outcome
- Application successfully migrated to AWS cloud
- Improved scalability and availability
- Secure access using IAM and security groups
- Easy monitoring with CloudWatch

---

## Why This Project
This project was created to gain real-world hands-on experience in: 
- AWS Cloud 
- On-premise to cloud migration
- DevOps automation using Terraform
- Cloud security and monitoring

---
