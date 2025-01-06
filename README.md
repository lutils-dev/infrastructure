# Infrastructure

This repository contains the infrastructure as code for our projects.

## Structure

- `modules/` - Reusable infrastructure modules
  - `static-website/` - S3 + CloudFront setup for static websites
- `projects/` - Project-specific implementations
  - Each project has prod and staging environments

## Usage

1. Navigate to the desired environment directory
2. Run `tofu init`
3. Run `tofu plan`
4. Run `tofu apply`

Deployment information will be generated in `deployment-info.json` files.
