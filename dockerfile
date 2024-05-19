# Use a base image with Python installed
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY api/requirements.txt /app/

# Install dependencies with timeout and retries
RUN pip install --no-cache-dir --timeout=600 --retries=5 -r requirements.txt


# Copy the rest of the application code into the container
COPY api/ /app/

# Expose the port on which the Flask app will run
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "app.py"]
