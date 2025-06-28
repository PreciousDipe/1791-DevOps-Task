# Use official Python base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy files
COPY ./app /app
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set default run command
CMD ["python", "main.py"]
