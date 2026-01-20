# Secure Node.js API – DevSecOps CI/CD Project

## Project Overview
This project demonstrates a production-grade DevSecOps CI/CD pipeline using GitHub Actions for a Node.js REST API.  
The pipeline integrates code quality checks, security scanning, containerization, and Kubernetes deployment concepts.

The focus of this project is not just automation, but **reasoning behind each CI/CD stage**, following shift-left security principles.

---

## Application Overview
The application is a lightweight Node.js REST API exposing:
- `/health` – health check endpoint
- `/message` – sample API endpoint

The application includes:
- Unit tests written in Jest
- Linting using ESLint
- Docker-based containerization

---

## How to Run Locally

### Prerequisites
- Node.js (v18+)
- Docker

### Run without Docker
```bash
npm install
npm test
npm start
```

### The application will start on:
http://localhost:3000

### Run using Docker
```bash
docker build -t secure-node-api .
docker run -p 3000:3000 secure-node-api
```

## CI Pipeline Explanation

### The CI pipeline is implemented using GitHub Actions and consists of the following stages:

- 1. Code Checkout

Retrieves the source code from the GitHub repository.

- 2. Runtime Setup

Sets up Node.js using actions/setup-node.

- 3. Linting (ESLint)

Enforces coding standards and prevents maintainability issues early.

- 4. Static Application Security Testing (SAST)

Uses GitHub CodeQL to detect common vulnerabilities such as injection flaws and insecure patterns.

- 5. Dependency Security Scan (SCA)

Uses npm audit to detect vulnerable third-party dependencies, addressing supply-chain risks.

- 6. Unit Testing

Runs Jest test cases to ensure business logic correctness and prevent regressions.

- 7. Docker Image Build

Packages the application into a Docker image using a multi-stage Dockerfile.

- 8. Container Vulnerability Scan

Uses Trivy to scan the Docker image for OS-level and library vulnerabilities.
The pipeline is configured to fail on HIGH and CRITICAL severity issues.

- 9. Container Smoke Test

Runs the container and validates runtime behavior using a health endpoint.

## CD Pipeline Explanation

The CD pipeline is implemented as a separate GitHub Actions workflow.

### CD Responsibilities:

* Triggered manually

* Applies Kubernetes deployment manifests

* Demonstrates container orchestration readiness

* Kubernetes manifests are stored under the k8s/ directory.

### Kubernetes Deployment

A sample Kubernetes Deployment manifest is provided:

* k8s/deployment.yaml


This demonstrates how the application would be deployed to a Kubernetes cluster (local or cloud-based).

### Secrets Configuration

The following GitHub Secrets are required for Docker registry integration:

* Secret Name	Purpose
* DOCKERHUB_USERNAME	Docker registry username
* DOCKERHUB_TOKEN	Docker registry access token


### Security & DevSecOps Practices

* Shift-left security using SAST and SCA

* Container image vulnerability scanning

* Multi-stage Docker builds to reduce attack surface

* No devDependencies shipped to production images

* Fail-fast CI pipeline design

### Limitations & Future Improvements

* Kubernetes deployment is demonstrated using static manifests

* No cloud-managed Kubernetes cluster integration

### Future improvements include:

* Helm charts

* Automated DAST

* Environment-based CD pipelines
