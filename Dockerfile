FROM python:3.9-slim

WORKDIR /app

# Copy application code
COPY . .

# Upgrade pip, setuptools, wheel first
RUN pip install --upgrade pip setuptools wheel

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5001

# Set Flask app environment
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5001

# Start the app using JSON CMD
CMD ["flask", "run"]
