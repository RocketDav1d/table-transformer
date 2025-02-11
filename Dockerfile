# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the packages.txt file and install system dependencies
COPY packages.txt /app/packages.txt
RUN apt-get update && apt-get install -y $(cat /app/packages.txt) && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip and install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the port that Streamlit will use (now 3000 to match Coolify)
EXPOSE 3000

# Run the Streamlit app on port 3000, binding to all network interfaces
CMD ["streamlit", "run", "src/streamlit_app.py", "--server.enableCORS", "false", "--server.address", "0.0.0.0", "--server.port", "3000"]
