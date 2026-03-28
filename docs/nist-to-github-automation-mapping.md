# NIST to GitHub Automation Mapping

This document maps sample NIST SP 800-53 controls to practical GitHub automation patterns used in this repository.

| Control | Intent | GitHub / Repo Automation | Evidence |
|---|---|---|---|
| AC-2 | Manage accounts and access | Require repository membership review and use CODEOWNERS or reviewer assignment for sensitive changes | Repo settings, reviewer history |
| AC-6 | Enforce least privilege | Restrict who can approve, merge, or deploy from protected branches | Branch protection, environment approvals |
| AU-2 | Define auditable events | Track pull requests, approvals, commits, workflow runs, and issue actions | GitHub audit trail, Actions logs |
| AU-12 | Generate and retain audit records | Preserve pull request history, workflow logs, scan results, and evidence references | PR history, workflow artifacts, evidence links |
| CA-7 | Continuous monitoring | Run scheduled and pull request based policy checks | GitHub Actions schedules and run history |
| CM-3 | Control configuration changes | Require pull requests for infrastructure and control updates | PR approvals, branch protection |
| CM-6 | Maintain secure baselines | Store approved Terraform and policy files in version control and test them in CI | Repo history, policy files, CI results |
| RA-5 | Scan for vulnerabilities | Run Checkov and additional scanning tools on Terraform and IaC changes | Scan output, workflow run results |
| SA-11 | Test security functionality | Add policy checks with Conftest or OPA before merge | Workflow logs, policy test results |

## Suggested GitHub controls to enable

- Protected `main` branch
- Required pull request reviews
- Status checks required before merge
- Dependabot alerts and secret scanning
- CODEOWNERS for compliance-sensitive folders
- GitHub Projects for remediation tracking

## Suggested repo areas to govern

- `terraform/` for infrastructure code
- `policies/` for policy-as-code
- `controls/` for control mappings
- `poam/` for remediation tracking
- `.github/workflows/` for compliance enforcement
