# Dockerfile for book_catalog microservice
# Python as a parent image
FROM python:3.10-slim

# Setting the working directory in the container
WORKDIR /app

# Copying the requirements file into the container at /app
COPY book_catalog/requirements.txt .

# Installing the dependencies listed in the file
RUN pip install --no-cache-dir -r requirements.txt

# Copying source files into the container at /app
COPY . . /app/

# Making port 8000 available to the world outside this container
EXPOSE 8000

# Command to run the application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--app-dir", "/app/book_catalog"]