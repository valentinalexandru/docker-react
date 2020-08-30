# Build phase config

FROM node:alpine as builder 
WORKDIR '/app'

# Install dependencies

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase config

FROM nginx

# Copy the /app/build folder from the build phase
# to the nginx volume

COPY --from=builder /app/build /usr/share/nginx/html
