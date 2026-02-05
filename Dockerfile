FROM node:18-bullseye

WORKDIR /app

# Copy dependency files first (better caching)
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy app source
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build the app
RUN yarn build

# Expose Cloud Run port
EXPOSE 8080

# Start the app
CMD ["node", "dist/index.js"]
