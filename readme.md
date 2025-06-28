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