# Compliance Automation Roadmap

## Phase 1: Foundation
- Create control mapping inventory
- Define POA&M workflow
- Protect the main branch
- Require pull requests and reviews
- Validate repo structure in CI

## Phase 2: Automated checks
- Add Terraform validation and plan checks
- Add IaC scanning with Checkov or tfsec
- Add policy-as-code with OPA or Conftest
- Add secret scanning and dependency scanning

## Phase 3: Evidence and reporting
- Generate control coverage reports
- Export open POA&M items by severity and due date
- Publish reviewer dashboards
- Track exceptions and inherited controls

## Phase 4: Production governance
- Add environment approvals
- Use OIDC for cloud authentication
- Restrict production deployments to approved roles
- Schedule recurring review workflows

## Recommended initial control focus
- AC-2
- AC-6
- AU-2
- AU-12
- CM-3
- CM-6
- RA-5
- CA-7
