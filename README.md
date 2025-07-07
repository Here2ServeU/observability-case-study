# Full-Stack Observability with OpenTelemetry, Splunk, and Terraform

## STAR-Based Case Study

### Situation

Modern distributed systems deployed on Kubernetes face significant challenges in debugging, performance monitoring, and root cause analysis. Most teams struggle with setting up reliable observability pipelines that cover infrastructure, services, and user experience.

There was a need for an end-to-end solution that provides full-stack observability—including distributed tracing, metrics, logs, and real user monitoring—across microservices running in a Kubernetes environment.

### Task

Design and deploy a production-grade observability platform that:
- Instruments microservices with OpenTelemetry
- Integrates with Splunk Observability Cloud for centralized APM, RUM, and infra metrics
- Uses Terraform for provisioning scalable EKS clusters
- Leverages Helm and ArgoCD for GitOps-based deployment and configuration
- Demonstrates local and cloud-based observability workflows
- Serves as a reusable case study for interviews and employer-readiness

### Action

#### 1. Infrastructure Provisioning with Terraform
- Created reusable Terraform scripts under `/terraform/` to provision:
  - VPC, subnets, internet gateway
  - EKS cluster and managed node groups
  - IAM roles for service access
- Configured AWS CLI, ran `terraform init` and `terraform apply`, then updated kubeconfig

#### 2. Observability Stack Deployment
- Deployed OpenTelemetry Collector via Helm with custom values
- Installed sample app `emmanuel_services-app.yaml` to generate telemetry data
- Connected OTel Collector to:
  - Splunk Observability Cloud (via `values-cloud.yaml`)
  - Local Splunk instance (via `values-local.yaml` for dev/testing)

#### 3. Local Splunk Deployment for Testing
- Used Docker to run Splunk for local APM simulation
- Configured OTel Collector to forward data to `host.docker.internal:8088`
- Enabled local trace/log validation without external cloud access

#### 4. GitOps Integration
- Prepared manifests and Helm values to be ArgoCD-compatible
- Structured Git repository to support continuous deployment patterns

#### 5. Dashboarding and Observability Features
- Created Splunk dashboards to visualize:
  - Distributed tracing
  - SLO/RUM metrics
  - Infrastructure and pod-level telemetry
- Documented usage and configurations in `/dashboards` and `README.md`

### Result

- Achieved end-to-end observability from application to infrastructure within a Kubernetes environment.
- Reduced Mean Time to Resolution (MTTR) by enabling:
  - Real-time traces and logs
  - Automatic metrics ingestion and correlation
- Enabled repeatable infrastructure with Terraform and GitOps
- Demonstrated platform readiness for enterprise-grade monitoring
- Created a complete portfolio project that simulates real-world monitoring pipelines using OpenTelemetry and Splunk

---

## Mastery Development Plan

| Skill Area                 | Used | Next Mastery Step |
|---------------------------|------|-------------------|
| Infrastructure as Code    | ✔️   | Add Terragrunt for multi-env and modularity |
| Kubernetes Observability  | ✔️   | Add Prometheus + Grafana for comparison and alerting |
| OpenTelemetry Integration | ✔️   | Add custom SDK-based instrumentation for Node.js/Python |
| CI/CD & GitOps            | ✔️   | Automate ArgoCD sync via GitHub Actions |
| Splunk Observability      | ✔️   | Integrate detectors, alerting rules, and SLO burn rate dashboards |
| Local Dev + Testing       | ✔️   | Add Docker Compose for full local observability test rig |
| Secrets Management        | 🚧   | Integrate AWS Secrets Manager or Sealed Secrets for HEC tokens |

---

## Suggested Next Steps

- [ ] Integrate GitHub Actions to deploy Terraform and sync Helm changes via ArgoCD
- [ ] Add OpenTelemetry SDK instrumentation for backend services (Node.js, Python)
- [ ] Include production-ready alerting and SLO enforcement via Splunk detectors
- [ ] Publish as a blog post or video walkthrough to explain real-world impact and architecture
- [ ] Add usage documentation for new engineers (runbooks, dashboards, troubleshooting guide)

---
## Author

**Emmanuel Naweji**  
📍 Crooks, SD  
🔗 [LinkedIn](https://linkedin.com/in/ready2assist) | [GitHub](https://github.com/Here2ServeU)  
📧 Email: emmanuelnt02@gmail.com

> Feel free to fork this project or reach out if you'd like to collaborate on similar observability tooling!

