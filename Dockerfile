# Use the official Python image as base
FROM python:latest

# Set the working directory
WORKDIR /app

# Clone the TaskWeaver repository
RUN git clone https://github.com/microsoft/TaskWeaver.git

# Change directory to TaskWeaver
WORKDIR /app/TaskWeaver

# Install requirements
RUN pip install -r requirements.txt

# Copy config settings
COPY config.json /app/TaskWeaver/config.json

# Install chainlit
RUN pip install chainlit

# Install google-generativeai
RUN pip install google-generativeai

# Change directory to playground/UI
WORKDIR /app/TaskWeaver/playground/UI

# Command to run the application
CMD ["chainlit run app.py"]
