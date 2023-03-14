# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory to /
WORKDIR /

# Copy the current directory contents into the container at /
COPY . /

# Copy the static folder to the container
COPY static /static

# Copy the templates folder to the container
COPY templates /templates

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV FLASK_APP=app.py

# Run the command to start the app
CMD ["flask", "run", "--host=0.0.0.0", "--port=8000"]
