# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements (if any) and app files
COPY app.py /app/

# Install Flask
RUN pip install flask

# Expose port 3000
EXPOSE 3000

# Run the app
CMD ["python", "app.py"]