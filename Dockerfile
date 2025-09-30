# Use an official Node.js image as the base (LTS version for stability)
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (Leverage Docker cache)
COPY package*.json ./

# Install dependencies in a clean environment
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the React app
RUN npm run build
# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
