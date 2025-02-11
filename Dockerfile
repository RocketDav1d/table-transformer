# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip and install any needed packages specified in requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the port that Streamlit uses (default is 8501)
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "src/streamlit_app.py", "--server.enableCORS", "false"]
