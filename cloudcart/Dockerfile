# Use official Python image
FROM python:3.13-slim

# Set working directory
WORKDIR /app

# Copy dependency file (Copy dependencies first for layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application source code
COPY . .

# Flask listens on port 5000
EXPOSE 5000

# Run the Flask application
CMD ["python", "app.py"] 