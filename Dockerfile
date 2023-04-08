# Use an official Node.js runtime as a parent image
FROM node:14 as build

# Set the working directory to /app
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/giuliano-db/totvs-teste-frontend.git

# Change the working directory to the app folder
WORKDIR /app/totvs-teste-frontend

# Install app dependencies
RUN npm install

# Build the app
RUN npm run build --prod

# Use an official nginx runtime as a parent image
FROM nginx:1.21-alpine

# Copy the built files from the previous stage to the nginx folder
COPY --from=build /app/totvs-teste-frontend/dist/totvs-teste-frontend /usr/share/nginx/html

# Expose port 4200
EXPOSE 4200

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
