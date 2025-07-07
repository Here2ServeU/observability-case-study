# Step-by-Step Deployment Guide: Full-Stack Observability with OpenTelemetry, Splunk, and Terraform

This guide walks you through deploying a full observability pipeline for microservices running in Kubernetes using OpenTelemetry, Splunk, and Terraform.

---

## STAR Overview

**Situation**  
Teams running microservices in Kubernetes often lack integrated visibility across logs, metrics, and traces. This limits their ability to detect issues early, reduce downtime, and improve system performance.

**Task**  
Build a production-like observability platform using OpenTelemetry, Splunk, and Terraform, enabling full-stack monitoring, distributed tracing, and GitOps-based deployment workflows.

**Action & Result**  
Each step below explains both what actions to take and how it contributes to building scalable and observable infrastructure. At the end of the process, you'll have a fully working observability platform with infrastructure as code, tracing, metrics, and monitoring dashboards.

---

## 1. Infrastructure Provisioning with Terraform

**Action**

### Prerequisites
- AWS CLI installed and configured
- Terraform v1.3+ installed
- kubectl and Helm installed

### Steps
1. Clone the repository:
```bash
git clone https://github.com/Here2ServeU/observability-case-study
cd observability-case-study/terraform
```

2. Configure AWS credentials:
```bash
aws configure
```

3. Initialize Terraform:
```bash
terraform init
```

4. Apply Terraform to provision the EKS cluster:
```bash
terraform apply
```

5. Update kubeconfig to access the cluster:
```bash
aws eks update-kubeconfig --name o11y-cluster --region us-east-1
```

**Result**  
You now have a production-ready Kubernetes cluster provisioned with reusable Terraform scripts.

---

## 2. Deploy OpenTelemetry Collector in Kubernetes

**Action**

### Steps
1. Add the Helm chart repo for OpenTelemetry:
```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
```

2. Deploy the OpenTelemetry Collector:
```bash
helm install otel-collector -f helm/otel-collector/values.yaml open-telemetry/opentelemetry-collector
```

**Result**  
The OpenTelemetry Collector is now ready to collect and export telemetry data to Splunk.

---

## 3. Deploy a Sample Application

**Action**

### Steps
1. Deploy a sample microservice to generate traces and metrics:
```bash
kubectl apply -f manifests/workloads/emmanuel_services-app.yaml
```

**Result**  
You have a live workload in Kubernetes emitting observable data for testing.

---

## 4. Set Up Local Splunk (Optional for Dev/Test)

**Action**

### Steps
1. Pull and run the Splunk Docker image:
```bash
docker pull splunk/splunk:latest
docker run -d --name splunk -p 8000:8000 -p 8088:8088 \
  -e SPLUNK_START_ARGS=--accept-license \
  -e SPLUNK_PASSWORD=changeme123 \
  splunk/splunk:latest
```

2. Access Splunk Web UI:
- URL: http://localhost:8000
- Login: `admin / changeme123`

**Result**  
You now have a local Splunk instance to test telemetry pipelines without cloud dependency.

---

## 5. Connect OpenTelemetry to Splunk

**Action**

### Steps
1. Edit `values.yaml` for either local or cloud Splunk:
```yaml
exporters:
  splunk_hec:
    token: YOUR_HEC_TOKEN
    endpoint: http://host.docker.internal:8088/services/collector
    source: otel-collector
    sourcetype: _json
```

2. Upgrade Helm release to apply changes:
```bash
helm upgrade otel-collector -f helm/otel-collector/values.yaml open-telemetry/opentelemetry-collector
```

**Result**  
Your observability pipeline is now connected to Splunk for real-time metrics and tracing.

---

## 6. View Metrics and Traces in Splunk

**Action**

### Steps
1. Log in to Splunk Observability Cloud or local instance
2. Navigate to APM and Infrastructure dashboards
3. Verify the presence of trace spans and metrics

**Result**  
You can now visualize system health, trace performance issues, and explore telemetry in Splunk.

---

## 7. Enable GitOps with ArgoCD (Optional)

**Action**

### Steps
1. Prepare your Helm charts and manifests
2. Install ArgoCD:
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

3. Access ArgoCD UI:
```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
- URL: https://localhost:8080

4. Add your Git repository and sync workloads

**Result**  
You have now set up a GitOps workflow to manage your observability stack declaratively.

---

## Final Result

You now have:
- A fully provisioned EKS cluster using Terraform
- OpenTelemetry deployed and configured for trace and metric collection
- Splunk integrated for APM and infrastructure dashboards
- GitOps-ready configuration using ArgoCD
- Optional local Splunk setup for testing and validation

---

## Next Steps

- [ ] Integrate GitHub Actions for full CI/CD automation
- [ ] Add OpenTelemetry SDKs to microservices (e.g., Node.js, Python)
- [ ] Configure Splunk detectors and alerting
- [ ] Expand dashboards with SLOs, error rates, and latency indicators

---

## Author

**Emmanuel Naweji**  
📍 Crooks, SD  
🔗 [LinkedIn](https://linkedin.com/in/ready2assist) | [GitHub](https://github.com/Here2ServeU)  
📧 Email: emmanuelnt02@gmail.com

