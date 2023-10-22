# Use the official Python base image
FROM python:3.10.1

# Set the working directory
WORKDIR /application

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Expose the port the app will run on
EXPOSE 8000

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

