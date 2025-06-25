# Full-Stack Observability in Kubernetes with OpenTelemetry, Splunk & Terraform

## Overview

This project demonstrates how to deploy a complete observability stack for microservices using:
- **OpenTelemetry Collector** for distributed tracing and metrics
- **Splunk Observability Suite** for APM, RUM, and Infrastructure Monitoring
- **Terraform** for provisioning an EKS cluster and infrastructure
- **Helm + ArgoCD** for GitOps-based deployment and configuration management

## Goals
- Achieve full-stack observability across Kubernetes workloads
- Reduce MTTR with distributed tracing and infrastructure metrics
- Use Infrastructure as Code (IaC) and GitOps for scalable, repeatable infrastructure
- Serve as a portfolio case study to demonstrate production-grade observability

---

## Infrastructure Provisioning (Terraform)

1. **Install prerequisites**:
   - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
   - [Terraform](https://developer.hashicorp.com/terraform/downloads)
   - [kubectl](https://kubernetes.io/docs/tasks/tools/)
   - [Helm](https://helm.sh/docs/intro/install/)

2. **Configure AWS credentials**:
```bash
aws configure
```

3. **Provision EKS using Terraform**:
```bash
cd terraform
terraform init
terraform apply
```

4. **Update kubeconfig**:
```bash
aws eks update-kubeconfig --name o11y-cluster --region us-east-1
```

---

## Deploying OpenTelemetry and Emmanuel Services App

1. **Deploy OpenTelemetry Collector via Helm**:
```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
helm install otel-collector -f helm/otel-collector/values.yaml open-telemetry/opentelemetry-collector
```

2. **Deploy Sample Application**:
```bash
kubectl apply -f manifests/workloads/emmanuel_services-app.yaml
```

3. **Monitor in Splunk**:
   - Log in to [Splunk Observability Cloud](https://login.signalfx.com)
   - Verify traces and metrics appear under APM and Infrastructure dashboards

---

## What You’ll Learn

- How to set up **OpenTelemetry instrumentation** for traces and metrics
- How to connect your observability pipeline to **Splunk APM/RUM**
- How to structure **Terraform for reusable cloud infrastructure**
- How to use **GitOps via ArgoCD** to manage Kubernetes configs
- How full observability helps in reducing downtime, improving dev feedback loops, and achieving compliance

---

## Benefits as a Case Study

| Benefit                          | Demonstrated In                         |
|----------------------------------|------------------------------------------|
| IaC & GitOps Mastery             | Terraform + ArgoCD Git workflows         |
| Advanced Observability Skills    | OpenTelemetry + Splunk Observability     |
| Kubernetes Proficiency           | EKS provisioning and workload deployment |
| CI/CD and Monitoring Integration | GitHub Actions + Prometheus/Grafana/Splunk |
| Employer Readiness               | Real-world traceability and RCA metrics  |

---

## Project Structure

```
.
├── terraform/                      # Infra provisioning scripts
├── helm/otel-collector/           # Helm values for OTel Collector
├── manifests/workloads/           # Sample app and config
├── dashboards/                    # Splunk dashboards
└── README.md                      # Full documentation
```

---

## Next Steps

- [ ] Add OpenTelemetry SDK instrumentation examples for Node.js and Python
- [ ] Integrate with GitHub Actions for auto-sync to ArgoCD
- [ ] Expand with custom metrics and alerts using Splunk detectors

---

## Author

**Emmanuel Naweji**  
📍 Crooks, SD  
🔗 [LinkedIn](https://linkedin.com/in/ready2assist) | [GitHub](https://github.com/Here2ServeU)  
Email: emmanuelnt02@gmail.com

---

> Feel free to fork this project or reach out if you'd like to collaborate on similar observability tooling!
