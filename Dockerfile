# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /my-react-app/

COPY my-react-app/public/ /my-react-app/public
COPY my-react-app/src/ /my-react-app/src
COPY my-react-app/package.json /my-react-app/

RUN npm install

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
RUN npm run build
RUN npm install -g serve

CMD ["serve", "-s", "build"]
