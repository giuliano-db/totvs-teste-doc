# Use an official Node.js runtime as a parent image
FROM node:18 as build

# Set the working directory to /app
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/giuliano-db/totvs-teste-frontend.git

# Change the working directory to the app folder
WORKDIR /app/totvs-teste-frontend
#RUN npm cache clean --force
#RUN rm -rf node_modules package-lock.json
# Install app dependencies
RUN npm install

# Build the app
RUN npm run build

# Use an official nginx runtime as a parent image
FROM nginx:1.21-alpine

# Copy the built files from the previous stage to the nginx folder
COPY --from=build /app/totvs-teste-frontend/dist/pessoa-frontend /usr/share/nginx/html

# Expose port 4200
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
