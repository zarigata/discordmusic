# Use an official Node runtime as a parent image
FROM node:current-slim

# Set working directory in container
WORKDIR /app

# Copy package.json file to image so that npm install command can be executed without internet access
COPY package*.json ./

# Install dependencies and cache them
RUN npm install --no-package-lock && npm cache clean --force

# Copy rest of the app code into container
COPY . .

# Expose port for the app to run on 
EXPOSE 3000

# Command to start your app when the container launches
CMD [ "node", "index.js" ]
