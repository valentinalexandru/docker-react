# Build phase config

FROM node:alpine
WORKDIR '/app'

# Install dependencies

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase config

FROM nginx

# Map the container to port 80

EXPOSE 80

# Copy the /app/build folder from the build phase
# to the nginx volume

COPY --from=0 /app/build /usr/share/nginx/html
