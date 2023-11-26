# Use an official Node runtime as a parent image
FROM node:12

# Set the working directory in the container
WORKDIR /usr/src/app

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the application
CMD ["npm", "start"]
