# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip and install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the port that Streamlit will use (now 3000 to match Coolify)
EXPOSE 3000

# Run the Streamlit app on port 3000
CMD ["streamlit", "run", "src/streamlit_app.py", "--server.enableCORS", "false", "--server.address", "0.0.0.0", "--server.port", "3000"]

