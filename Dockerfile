FROM python:3.11

# Set working directory
WORKDIR /app

# Install system dependencies (for cv2 + OpenCV)
RUN apt-get update && \
    apt-get install -y libgl1 libglib2.0-0 curl && \
    rm -rf /var/lib/apt/lists/*

# Install NodeJS 18 (for PyTgCalls)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    node -v

# Copy project files
COPY . /app

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start the bot
CMD ["bash", "start"]
