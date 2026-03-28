# OPA / Conftest Policies

This folder contains Rego policies evaluated by Conftest against Terraform plan JSON.

## How it works

1. Run `terraform init`
2. Run `terraform plan -out=tfplan`
3. Convert the plan to JSON with `terraform show -json tfplan > tfplan.json`
4. Evaluate the plan with:

```bash
conftest test tfplan.json --policy policies/opa/terraform
```

## Current policy coverage

- Required tags on S3 buckets
- Public access blocking required
- Server-side encryption configuration required
- Versioning configuration required

## Why this matters

This pattern helps enforce secure baseline expectations before infrastructure changes are merged or applied.
