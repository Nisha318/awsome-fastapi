# Use an official Python runtime as a parent image
FROM public.ecr.aws/docker/library/python:python:3.12.5-bookworm

# Set the working directory in the container
WORKDIR /app

# Install system dependencies if needed, 
# not supported by Nexus unfortunately
RUN apt-get update -y


# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . .

# Expose port 80 to the outside world
EXPOSE 80

# Run app.py when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
