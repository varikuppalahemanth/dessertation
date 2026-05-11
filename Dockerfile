# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip setuptools wheel && \
    pip install -r requirements.txt

# Copy project files
COPY CLIENT.py .
COPY code_vulnerabilities.csv .
COPY README.md .

# Create directory for output/results
RUN mkdir -p /app/results

# Expose port for potential API service
EXPOSE 5000

# Default command to run the vulnerability detection script
CMD ["python", "CLIENT.py"]
