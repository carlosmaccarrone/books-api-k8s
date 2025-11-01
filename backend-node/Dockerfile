# Base image
FROM node:20

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first to take advantage of Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application source code
COPY src/ ./src/

# Expose the API port
EXPOSE 3000

# Default command to run the server
CMD ["node", "src/server.js"]