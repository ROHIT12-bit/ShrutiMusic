FROM python:3.11

# Set working directory
WORKDIR /app

# Install NodeJS 18 (required for PyTgCalls)
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    node -v

# Copy project files
COPY . /app

# Install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start the bot
CMD ["bash", "start"]
