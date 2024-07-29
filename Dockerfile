# Official Python runtime slim version
# For more about docker images refer https://hub.docker.com
FROM python:3.8-slim-buster

# Set the workdir in the container to /app
WORKDIR /app

# Add the current dir contents into the container at /app
ADD . /app

# Install any needed packages mentioned in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run Gunicorn web server when the container launches
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]