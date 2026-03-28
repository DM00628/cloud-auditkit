# Cloud AuditKit

A starter GitHub project for automating compliance workflows with infrastructure-as-code, policy checks, evidence tracking, and remediation management.

## What this repo is for

This repository is designed to help automate compliance activities for frameworks such as NIST SP 800-53, FedRAMP, VA 6500, HIPAA, and internal control baselines.

## Core capabilities

- Track controls and implementation status
- Run automated compliance checks in GitHub Actions
- Store policy-as-code and reusable templates
- Capture evidence references and audit notes
- Manage POA&M items and remediation tasks

## Starter structure

- `.github/workflows/` for automation
- `controls/` for control catalogs and mappings
- `evidence/` for evidence requests and references
- `poam/` for remediation tracking
- `docs/` for governance and operating guidance

## First steps

1. Add your framework mapping in `controls/control-mapping.csv`
2. Customize the workflow in `.github/workflows/compliance-check.yml`
3. Add your issue templates for findings and evidence requests
4. Protect the `main` branch and require pull requests
