FROM node:18
WORKDIR /app
# Copy package.json and yarn.lock first for caching
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the app
COPY . .

# Generate Prisma client 
RUN npm run generate

# Expose port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
