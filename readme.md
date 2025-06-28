# 📦 CI/CD Pipeline Documentation

## Overview

This project utilizes GitHub Actions to implement a complete CI/CD pipeline with dedicated workflows for:

- Continuous Integration (`ci.yml`)
- Continuous Deployment (`cd.yml`)
- Rollback and Recovery (`rollback.yml`)

---

## 🔧 CI Pipeline (`ci.yml`)

### Trigger:
- On `pull_request` to `dev` or `master`.

### Jobs:
- **Lint**:
  - Uses `flake8` to enforce Python code quality.
- **Test**:
  - Runs unit tests using `pytest`.
  - Ensures `PYTHONPATH` is set properly.

---

## 🚀 CD Pipeline (`cd.yml`)

### Trigger:
- On `push` to `dev` or `master`.

### Jobs:

#### 🔨 `build-and-push`:
- Builds Docker image using the format: `ghcr.io/OWNER/REPO:branch-run_number`
- Pushes image to **GitHub Container Registry (GHCR)**.

#### 🌐 `deploy-dev`:
- Triggered only for the `dev` branch.
- Deploys to a **self-hosted development environment** via SSH.

#### 🌐 `deploy-prod`:
- Triggered only for the `master` branch.
- Deploys to a **self-hosted production environment** via SSH.

---

## 🔁 Rollback Pipeline (`rollback.yml`)

### Trigger:
- Manual via `workflow_dispatch`.
- Automatic on failure of the `cd.yml` workflow via `workflow_run`.

### Logic:
- Derives the previous image tag based on `run_number - 1`.
- Pulls and redeploys the last working Docker image.

---

## 🔐 Secrets and Configuration

### Required GitHub Secrets:
- `SSH_PRIVATE_KEY`: Private key for the deployment server.
- `SSH_USER`: Remote server user.
- `SERVER_IP`: Remote server address.

### Environment Structure:
| Branch      | Environment   | Tag Format            |
|-------------|---------------|------------------------|
| `dev`       | Development   | `dev-<run_number>`     |
| `master`    | Production    | `master-<run_number>`  |

---

## ✅ Summary

- **Modular workflows** enhance readability and responsibility separation.
- **Secure, environment-specific deployments** with auto rollback.
- **CI runs lint and tests for quality assurance.**
- **Robust and production-ready** DevOps practice via GitHub Actions.



# 🐍 1791 DevOps Task

A simple Python project with CI/CD, linting, and testing configured using GitHub Actions.

---

## 📦 Project Structure

```
1791-DevOps-Task/
├── app/
│   └── main.py
├── tests/
│   └── test_main.py
├── .github/
│   └── workflows/
│       └── ci.yml      
|       └── cd.yml
├── .flake8
├── requirements.txt
├── README.md
```

## 🚀 Getting Started
### 1. Clone the repository
```bash
git clone https://github.com/your-username/my-app.git
cd app
```

### 2. Create a virtual environment (optional)
```bash
python3 -m venv venv
source venv/bin/activate   # On Windows: venv\Scripts\activate
```

### 3. Install dependencies
```bash
pip install -r requirements.txt
```

### 4. Running Tests
```bash
export PYTHONPATH=.
pytest
```

### 5. Running the App
```bash
python app/main.py
```