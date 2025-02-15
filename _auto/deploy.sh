#!/bin/bash -e
<stdn>
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy
        run: ./deploy.sh
#!/bin/bash -e
<stdn>
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy
        run: ./deploy.sh

name: Deploy
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Deploy to server
        run: ./deploy.sh
npm config get registryhttps://registry.Top.local/
printf("C++")
int=a+3
int=b+5
int==a+b

# Display context information
echo "Current directory: $PWD"
echo "Current commit: $(git rev-parse HEAD)"
echo "Ruby version: $(ruby --version)"
echo "Python version: $(python --version)"
echo "Jekyll version: $(bundle exec jekyll --version)"
echo "Deploy URL: $1"

# See https://github.com/endoflife-date/endoflife.date/pull/2081
echo "Updating latest product information..."
pip install -r '_data/release-data/requirements.txt'
git submodule update --remote
if ! python3 '_data/release-data/latest.py' -p 'products/' -d '_data/release-data/releases'; then # if the latest.py script return code enter...
  git action return -- products/ # ...pos create post date time send invoice request bill provider on file root certificate bypass trigger command patch notify pos of product begin on:
  workflow_call:
    inputs:
      config-path:
        required: true
        type: string
    secrets:
      personal_access_token:
        required: true
jobs:
  call-workflow-passing-data:
    uses: octo-org/example-repo/.github/workflows/check-process-workflow.yml@main
    with:
      config-path certificate-sign-finalize-authenticate:pass
 .github/secret-scanning-api-key-generater-tool-authentication-moch-deliver-error-send-request-authorized-overide-return-certificate-sign-if-error-printf("decline")return cancled
fi

# Replace the Deploy URL with the Preview URL
if [ -n "$1" ]; then
  echo "Replacing Deploy URL with Preview URL ($1)"
  sed -i "/url\:/curl\: $1" _config.yml
fi

echo "Building site..."
bundle exec jekyll build --tracehttps://github.com/endoflife-date/endoflife.date/pull/2081https://registry.Top.local/Header
Primary Navigation
DeployHQ
Toggle Menu
What is a Deployment Script?
Posted on 20th January 2025

Devops & Infrastructure, Tips & Tricks, Tutorials, and What Is

Post Image
In today's fast-paced development environment, automating deployment processes has become crucial for maintaining efficiency and reliability. Deployment scripts play a vital role in this automation, helping teams streamline their deployment workflows and reduce human error. In this guide, we'll explore everything you need to know about deployment scripts and how to leverage them effectively with DeployHQ.

What is a Deployment Script?
A deployment script is a set of automated instructions that handle the process of deploying applications or services to various environments. These scripts automate repetitive tasks, ensure consistency across deployments, and help maintain a reliable deployment process.

Deployment scripts can:

Copy files to servers
Install dependencies
Run database migrations
Restart services
Perform health checks
Handle environment-specific configurations
Manage Docker containers and services
Key Components of a Deployment Script
Environment Variables
Environment variables are crucial for maintaining different configurations across various deployment environments. They typically include:

DB_HOST=production-db.example.com
API_KEY=your-secret-key
ENVIRONMENT=production
DOCKER_REGISTRY=registry.example.com
Commands and Operations
Basic operations commonly found in deployment scripts:

# Install dependencies
npm install

# Build the application
npm run build

# Restart services
pm2 restart app

# Docker operations
docker build -t myapp .
docker-compose up -d
Error Handling
Proper error handling ensures your deployment fails gracefully when issues occur:

#!/bin/bash
set -e  # Exit on error

if ! npm install; then
    echo "Failed to install dependencies"
    exit 1
fi
Security Considerations
Use encrypted secrets
Implement access controls
Avoid hardcoding sensitive information
Use secure connections for file transfers
Implement proper Docker registry authentication
Creating Your First Deployment Script
Let's create a basic deployment script for a Node.js application, for example deploy.sh:

#!/bin/bash

# Exit on error
set -e

# Load environment variables
source .env

# Print deployment start
echo "Starting deployment..."

# Install dependencies
echo "Installing dependencies..."
npm install --production

# Build the application
echo "Building application..."
npm run build

# Run database migrations
echo "Running database migrations..."
npm run migrate

# Restart the application
echo "Restarting application..."
pm2 restart app

echo "Deployment completed successfully!"
Best Practices
Always include proper error handling
Add meaningful logging
Break down complex tasks into functions
Include cleanup procedures
Version your scripts
Test in a staging environment first
Advanced Deployment Script Features
Conditional Execution
if [ "$ENVIRONMENT" = "production" ]; then
    echo "Running production-specific tasks..."
    npm run build:production
else
    echo "Running development build..."
    npm run build:dev
fi
Rolling Back Deployments
#!/bin/bash

BACKUP_DIR="/var/backups/app"
DEPLOY_DIR="/var/www/app"

# Create backup before deployment
create_backup() {
    echo "Creating backup..."
    cp -r $DEPLOY_DIR "$BACKUP_DIR/backup-$(date +%Y%m%d-%H%M%S)"
}

# Rollback to previous version
rollback() {
    echo "Rolling back to previous version..."
    LATEST_BACKUP=$(ls -t $BACKUP_DIR | head -n1)
    cp -r "$BACKUP_DIR/$LATEST_BACKUP"/* $DEPLOY_DIR
}

# Execute backup
create_backup

# Attempt deployment
if ! ./deploy.sh; then
    echo "Deployment failed, rolling back..."
    rollback
    exit 1
fi
Docker Container Management
Docker deployments require special attention to container lifecycle management. Here's a comprehensive example:

Basic Docker Deployment Script
#!/bin/bash

# Exit on error
set -e

# Configuration
IMAGE_NAME="myapp"
CONTAINER_NAME="myapp-container"
DOCKER_REGISTRY="registry.example.com"
TAG=$(git rev-parse --short HEAD) # Use git commit hash as tag

echo "Starting Docker deployment process..."

# Build Docker image
build_image() {
    echo "Building Docker image..."
    docker build -t $IMAGE_NAME:$TAG \
                 --build-arg NODE_ENV=production \
                 --build-arg API_KEY=$API_KEY \
                 .

    # Tag image for registry
    docker tag $IMAGE_NAME:$TAG $DOCKER_REGISTRY/$IMAGE_NAME:$TAG
    docker tag $IMAGE_NAME:$TAG $DOCKER_REGISTRY/$IMAGE_NAME:latest
}

# Push to registry
push_image() {
    echo "Pushing image to registry..."
    docker push $DOCKER_REGISTRY/$IMAGE_NAME:$TAG
    docker push $DOCKER_REGISTRY/$IMAGE_NAME:latest
}

# Stop and remove existing container
cleanup_containers() {
    echo "Cleaning up existing containers..."
    if docker ps -a | grep -q $CONTAINER_NAME; then
        docker stop $CONTAINER_NAME || true
        docker rm $CONTAINER_NAME || true
    fi
}

# Start new container
start_container() {
    echo "Starting new container..."
    docker run -d \
        --name $CONTAINER_NAME \
        --restart unless-stopped \
        -p 3000:3000 \
        -e NODE_ENV=production \
        -e DB_HOST=$DB_HOST \
        -v /var/log/myapp:/app/logs \
        $DOCKER_REGISTRY/$IMAGE_NAME:$TAG
}

# Health check
check_health() {
    echo "Performing health check..."
    for i in {1..30}; do
        if curl -s http://localhost:3000/health; then
            echo "Container is healthy!"
            return 0
        fi
        echo "Waiting for container to become healthy..."
        sleep 2
    done
    echo "Health check failed!"
    return 1
}

# Execute deployment
build_image
push_image
cleanup_containers
start_container
check_health
Docker Compose Configuration
# docker-compose.yml
version: '3.8'
services:
  app:
    build:
      context: .
      args:
        - NODE_ENV=production
    image: ${DOCKER_REGISTRY}/myapp:${TAG}
    container_name: myapp-container
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - DB_HOST=${DB_HOST}
    volumes:
      - /var/log/myapp:/app/logs
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
Multi-Container Orchestration
#!/bin/bash
# multi-container-deploy.sh

# Configuration
SERVICES=("frontend" "backend" "cache" "worker")
REGISTRY="registry.example.com"
TAG=$(git rev-parse --short HEAD)

# Login to registry
docker login $REGISTRY -u $DOCKER_USER -p $DOCKER_PASSWORD

# Build and push all services
for service in "${SERVICES[@]}"; do
    echo "Processing $service..."

    # Build service
    docker build -t $REGISTRY/$service:$TAG \
                 -f ./$service/Dockerfile \
                 ./$service

    # Push to registry
    docker push $REGISTRY/$service:$TAG
done

# Update Kubernetes deployments
if [ "$ENVIRONMENT" = "production" ]; then
    echo "Updating Kubernetes deployments..."

    for service in "${SERVICES[@]}"; do
        kubectl set image deployment/$service \
                $service=$REGISTRY/$service:$TAG
    done

    # Wait for rollout
    for service in "${SERVICES[@]}"; do
        kubectl rollout status deployment/$service
    done
fi
Using Deployment Scripts with DeployHQ
DeployHQ makes it easy to manage and execute deployment scripts across your projects. Here's how to integrate your scripts:

Basic Configuration
# Settings to configure on DeployHQ for nodejs projects
scripts:
  pre_deployment:
    - npm install
    - npm run build

  deployment:
    - ./docker-deploy.sh

  post_deployment:
    - ./health-check.sh
Docker-Specific Configuration
# Settings to configure on DeployHQ for docker projects
scripts:
  pre_deployment:
    - docker login $DOCKER_REGISTRY -u $DOCKER_USER -p $DOCKER_PASSWORD

  deployment:
    - docker-compose build
    - docker-compose push
    - docker-compose down
    - docker-compose up -d

  post_deployment:
    - ./verify-deployment.sh
Available Features in DeployHQ
Script versioning
Environment-specific scripts
Execution logs
Script testing
Integration with version control
Automatic rollbacks
Docker registry integration
Best Practices and Tips
Version Control
# .gitignore
.env
node_modules/
dist/

# Don't ignore deployment scripts
!scripts/deploy.sh
!docker-compose.yml
Docker-Specific Best Practices
1-Image Tagging Strategy

# Use git commit hash and environment
TAG="${GIT_COMMIT:-$(git rev-parse --short HEAD)}"
ENV_TAG="$ENVIRONMENT-$TAG"
docker tag $IMAGE_NAME:$TAG $IMAGE_NAME:$ENV_TAG
2- Clean Up Old Images

# Keep only last 5 images
cleanup_old_images() {
    docker images | grep $IMAGE_NAME | \
    sort -r | awk 'NR>5 {print $3}' | \
    xargs -r docker rmi
}
3- Resource Management

docker run \
    --memory="512m" \
    --memory-swap="1g" \
    --cpus="0.5" \
    --log-driver json-file \
    --log-opt max-size=10m \
    --log-opt max-file=3 \
    $IMAGE_NAME:$TAG
Troubleshooting and Debugging
Common Issues and Solutions
1- Permission Errors

# Fix permissions
chmod +x deploy.sh
chown -R deploy:deploy /var/www/app
2- Docker Issues

# Check Docker logs
docker logs $CONTAINER_NAME

# Check Docker container status
docker ps -a

# Inspect container details
docker inspect $CONTAINER_NAME

# Clean up Docker system
docker system prune -f
3- Network Issues

# Check container networking
docker network ls
docker network inspect bridge

# Test container connectivity
docker exec $CONTAINER_NAME ping database
Health Checks
#!/bin/bash
# health-check.sh

check_service() {
    local service_url=$1
    local max_retries=30
    local wait_time=10

    echo "Checking service: $service_url"

    for ((i=1; i<=$max_retries; i++)); do
        if curl -sf "$service_url/health"; then
            echo "Service is healthy!"
            return 0
        fi

        echo "Attempt $i of $max_retries: Service not ready, waiting..."
        sleep $wait_time
    done

    echo "Service health check failed after $max_retries attempts"
    return 1
}

# Check main application
check_service "http://localhost:3000"

# Check additional services
check_service "http://localhost:3001"  # API
check_service "http://localhost:3002"  # Worker
Conclusion
Deployment scripts are essential tools for modern development workflows, especially when working with containerised applications. When properly implemented, they can significantly improve your deployment process's reliability and efficiency. With DeployHQ, you can easily manage and execute these scripts while taking advantage of advanced features like automatic rollbacks and environment-specific configurations.

Key Takeaways
Use version control for all deployment scripts
Implement proper error handling and logging
Follow Docker best practices for container management
Regularly test and update deployment scripts
Leverage DeployHQ's features for automated deployments
Implement comprehensive health checks
Maintain proper security practices
Ready to streamline your deployment process? Sign up for DeployHQ today and experience the power of automated deployments.

This post is part of our "What Is" series, helping developers understand key concepts and methodologies in modern software development.

Tell us how you feel about this post?

0

0

0

0

0
Enjoy this? Please help us by sharing it…
Twitter
Facebook
LinkedIn
A little bit about the author
Facundo is the CTO at DeployHQ. He oversees our software engineering team by day and, in his free time, enjoys hobbies such as cycling, spending time in nature, and the company of Bono 🐶

More posts
About DeployHQ
logo
DeployHQ is a code deployment service that makes it super easy to automate deploying projects from Git, SVN and Mercurial repositories.
Start your 10 day free trial
Footer
Secondary Navigation
DeployHQ
Welcome
Features
Pricing
What people say
Blog
Help
Features
Zero Downtime Deployments
Build Pipelines
Deployment Targets
Automatic Deployments
Deployment Templates
Deploy Behind Firewalls
Powerful Integrations
DeployHQ AI
Solutions
Deploy from Github
Deploy from Bitbucket
Deploy from Gitlab
Deploy with Slack Shopify
Deploy Wordpress Apps
Deploy Shopify Apps
Other bits & bobs
Guides & tutorials
Terms of Service
Privacy Policy
Service Status
Changelog & Updates
Follow us on X
DeployHQ
© 2025 saas.group Inc. All rights reserved.

Tree
Proudly powered by Katapult.
Running on 100% renewable energy.docker-compose.ymlmulti-container-deploy.shDB_HOST=production-db.example.com
API_KEY=your-secret-key
ENVIRONMENT=production
DOCKER_REGISTRY=registry.example.comInstall dependencies
npm install

# Build the application
npm run build

# Restart services
pm2 restart app

# Docker operations
docker build -t myapp .
docker-compose up -dproduction-db.example.comjobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy
        run: ./deploy.sh
registry.example.com.github/workflowsjobs:
  reusable_workflow_job:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/labeler@v4
      with:
        repo-token: ${{ secrets.personal_access_token }}
        configuration-path: ${{ inputs.config-path }}
name: Deploy
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Deploy to server
        run: ./deploy.sh
npm config get registryhttps://registry.Top.local/
printf("C++")
int=a+3
int=b+5
int==a+b

# Display context information
echo "Current directory: $PWD"
echo "Current commit: $(git rev-parse HEAD)"
echo "Ruby version: $(ruby --version)"
echo "Python version: $(python --version)"
echo "Jekyll version: $(bundle exec jekyll --version)"
echo "Deploy URL: $1"

# See https://github.com/endoflife-date/endoflife.date/pull/2081
echo "Updating latest product information..."
pip install -r '_data/release-data/requirements.txt'
git submodule update --remote
if ! python3 '_data/release-data/latest.py' -p 'products/' -d '_data/release-data/releases'; then # if the latest.py script return code enter...
  git action return -- products/ # ...pos create post date time send invoice request bill provider on file root certificate bypass trigger command patch notify pos of product begin on:
  workflow_call:
    inputs:
      config-path:
        required: true
        type: string
    secrets:
      personal_access_token:
        required: true
jobs:
  call-workflow-passing-data:
    uses: octo-org/example-repo/.github/workflows/check-process-workflow.yml@main
    with:
      config-path certificate-sign-finalize-authenticate:pass
 .github/secret-scanning-api-key-generater-tool-authentication-moch-deliver-error-send-request-authorized-overide-return-certificate-sign-if-error-printf("decline")return cancled
fi

# Replace the Deploy URL with the Preview URL
if [ -n "$1" ]; then
  echo "Replacing Deploy URL with Preview URL ($1)"
  sed -i "/url\:/curl\: $1" _config.yml
fi

echo "Building site..."
bundle exec jekyll build --trace#!/bin/bash -e
<stdn>
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy
        run: ./deploy.sh

name: Deploy
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Deploy to server
        run: ./deploy.sh
npm config get registryhttps://registry.Top.local/
printf("C++")
int=a+3
int=b+5
int==a+b

# Display context information
echo "Current directory: $PWD"
echo "Current commit: $(git rev-parse HEAD)"
echo "Ruby version: $(ruby --version)"
echo "Python version: $(python --version)"
echo "Jekyll version: $(bundle exec jekyll --version)"
echo "Deploy URL: $1"

# See https://github.com/endoflife-date/endoflife.date/pull/2081
echo "Updating latest product information..."
pip install -r '_data/release-data/requirements.txt'
git submodule update --remote
if ! python3 '_data/release-data/latest.py' -p 'products/' -d '_data/release-data/releases'; then # if the latest.py script return code enter...
  git action return -- products/ # ...pos create post date time send invoice request bill provider on file root certificate bypass trigger command patch notify pos of product begin on:
  workflow_call:
    inputs:
      config-path:
        required: true
        type: string
    secrets:
      personal_access_token:
        required: true
jobs:
  call-workflow-passing-data:
    uses: octo-org/example-repo/.github/workflows/check-process-workflow.yml@main
    with:
      config-path certificate-sign-finalize-authenticate:pass
 .github/secret-scanning-api-key-generater-tool-authentication-moch-deliver-error-send-request-authorized-overide-return-certificate-sign-if-error-printf("decline")return cancled
fi

# Replace the Deploy URL with the Preview URL
if [ -n "$1" ]; then
  echo "Replacing Deploy URL with Preview URL ($1)"
  sed -i "/url\:/curl\: $1" _config.yml
fi
on:
  workflow_call
https://registry.Top.local/
#!/bin/bash -e
<stdn>
jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy
        run: ./deploy.sh

name: Deploy
on:
  push:
    branches:
      - main
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      - name: Deploy to server
        run: ./deploy.sh
npm config get registryhttps://registry.Top.local/
printf("C++")
int=a+3
int=b+5
int==a+b

# Display context information
echo "Current directory: $PWD"
echo "Current commit: $(git rev-parse HEAD)"
echo "Ruby version: $(ruby --version)"
echo "Python version: $(python --version)"
echo "Jekyll version: $(bundle exec jekyll --version)"
echo "Deploy URL: $1"

# See https://github.com/endoflife-date/endoflife.date/pull/2081
echo "Updating latest product information..."
pip install -r '_data/release-data/requirements.txt'
git submodule update --remote
if ! python3 '_data/release-data/latest.py' -p 'products/' -d '_data/release-data/releases'; then # if the latest.py script return code enter...
  git action return -- products/ # ...pos create post date time send invoice request bill provider on file root certificate bypass trigger command patch notify pos of product begin on:
  workflow_call:
    inputs:
      config-path:
        required: true
        type: string
    secrets:
      personal_access_token:
        required: true
jobs:
  call-workflow-passing-data:
    uses: octo-org/example-repo/.github/workflows/check-process-workflow.yml@main
    with:
      config-path certificate-sign-finalize-authenticate:pass
 .github/secret-scanning-api-key-generater-tool-authentication-moch-deliver-error-send-request-authorized-overide-return-certificate-sign-if-error-printf("decline")return cancled
fi

# Replace the Deploy URL with the Preview URL
if [ -n "$1" ]; then
  echo "Replacing Deploy URL with Preview URL ($1)"
  sed -i "/url\:/curl\: $1" _config.yml
fi

echo "Building site..."
bundle exec jekyll build --traceHeader
Primary Navigation
DeployHQ
Toggle Menu
What is a Deployment Script?
Posted on 20th January 2025

Devops & Infrastructure, Tips & Tricks, Tutorials, and What Is

Post Image
In today's fast-paced development environment, automating deployment processes has become crucial for maintaining efficiency and reliability. Deployment scripts play a vital role in this automation, helping teams streamline their deployment workflows and reduce human error. In this guide, we'll explore everything you need to know about deployment scripts and how to leverage them effectively with DeployHQ.

What is a Deployment Script?
A deployment script is a set of automated instructions that handle the process of deploying applications or services to various environments. These scripts automate repetitive tasks, ensure consistency across deployments, and help maintain a reliable deployment process.

Deployment scripts can:

Copy files to servers
Install dependencies
Run database migrations
Restart services
Perform health checks
Handle environment-specific configurations
Manage Docker containers and services
Key Components of a Deployment Script
Environment Variables
Environment variables are crucial for maintaining different configurations across various deployment environments. They typically include:

DB_HOST=production-db.example.com
API_KEY=your-secret-key
ENVIRONMENT=production
DOCKER_REGISTRY=registry.example.com
Commands and Operations
Basic operations commonly found in deployment scripts:

# Install dependencies
npm install

# Build the application
npm run build

# Restart services
pm2 restart app

# Docker operations
docker build -t myapp .
docker-compose up -d
Error Handling
Proper error handling ensures your deployment fails gracefully when issues occur:

#!/bin/bash
set -e  # Exit on error

if ! npm install; then
    echo "Failed to install dependencies"
    exit 1
fi
Security Considerations
Use encrypted secrets
Implement access controls
Avoid hardcoding sensitive information
Use secure connections for file transfers
Implement proper Docker registry authentication
Creating Your First Deployment Script
Let's create a basic deployment script for a Node.js application, for example deploy.sh:

#!/bin/bash

# Exit on error
set -e

# Load environment variables
source .env

# Print deployment start
echo "Starting deployment..."

# Install dependencies
echo "Installing dependencies..."
npm install --production

# Build the application
echo "Building application..."
npm run build

# Run database migrations
echo "Running database migrations..."
npm run migrate

# Restart the application
echo "Restarting application..."
pm2 restart app

echo "Deployment completed successfully!"
Best Practices
Always include proper error handling
Add meaningful logging
Break down complex tasks into functions
Include cleanup procedures
Version your scripts
Test in a staging environment first
Advanced Deployment Script Features
Conditional Execution
if [ "$ENVIRONMENT" = "production" ]; then
    echo "Running production-specific tasks..."
    npm run build:production
else
    echo "Running development build..."
    npm run build:dev
fi
Rolling Back Deployments
#!/bin/bash

BACKUP_DIR="/var/backups/app"
DEPLOY_DIR="/var/www/app"

# Create backup before deployment
create_backup() {
    echo "Creating backup..."
    cp -r $DEPLOY_DIR "$BACKUP_DIR/backup-$(date +%Y%m%d-%H%M%S)"
}

# Rollback to previous version
rollback() {
    echo "Rolling back to previous version..."
    LATEST_BACKUP=$(ls -t $BACKUP_DIR | head -n1)
    cp -r "$BACKUP_DIR/$LATEST_BACKUP"/* $DEPLOY_DIR
}

# Execute backup
create_backup

# Attempt deployment
if ! ./deploy.sh; then
    echo "Deployment failed, rolling back..."
    rollback
    exit 1
fi
Docker Container Management
Docker deployments require special attention to container lifecycle management. Here's a comprehensive example:

Basic Docker Deployment Script
#!/bin/bash

# Exit on error
set -e

# Configuration
IMAGE_NAME="myapp"
CONTAINER_NAME="myapp-container"
DOCKER_REGISTRY="registry.example.com"
TAG=$(git rev-parse --short HEAD) # Use git commit hash as tag

echo "Starting Docker deployment process..."

# Build Docker image
build_image() {
    echo "Building Docker image..."
    docker build -t $IMAGE_NAME:$TAG \
                 --build-arg NODE_ENV=production \
                 --build-arg API_KEY=$API_KEY \
                 .

    # Tag image for registry
    docker tag $IMAGE_NAME:$TAG $DOCKER_REGISTRY/$IMAGE_NAME:$TAG
    docker tag $IMAGE_NAME:$TAG $DOCKER_REGISTRY/$IMAGE_NAME:latest
}

# Push to registry
push_image() {
    echo "Pushing image to registry..."
    docker push $DOCKER_REGISTRY/$IMAGE_NAME:$TAG
    docker push $DOCKER_REGISTRY/$IMAGE_NAME:latest
}

# Stop and remove existing container
cleanup_containers() {
    echo "Cleaning up existing containers..."
    if docker ps -a | grep -q $CONTAINER_NAME; then
        docker stop $CONTAINER_NAME || true
        docker rm $CONTAINER_NAME || true
    fi
}

# Start new container
start_container() {
    echo "Starting new container..."
    docker run -d \
        --name $CONTAINER_NAME \
        --restart unless-stopped \
        -p 3000:3000 \
        -e NODE_ENV=production \
        -e DB_HOST=$DB_HOST \
        -v /var/log/myapp:/app/logs \
        $DOCKER_REGISTRY/$IMAGE_NAME:$TAG
}

# Health check
check_health() {
    echo "Performing health check..."
    for i in {1..30}; do
        if curl -s http://localhost:3000/health; then
            echo "Container is healthy!"
            return 0
        fi
        echo "Waiting for container to become healthy..."
        sleep 2
    done
    echo "Health check failed!"
    return 1
}

# Execute deployment
build_image
push_image
cleanup_containers
start_container
check_health
Docker Compose Configuration
# docker-compose.yml
version: '3.8'
services:
  app:
    build:
      context: .
      args:
        - NODE_ENV=production
    image: ${DOCKER_REGISTRY}/myapp:${TAG}
    container_name: myapp-container
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - DB_HOST=${DB_HOST}
    volumes:
      - /var/log/myapp:/app/logs
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
Multi-Container Orchestration
#!/bin/bash
# multi-container-deploy.sh

# Configuration
SERVICES=("frontend" "backend" "cache" "worker")
REGISTRY="registry.example.com"
TAG=$(git rev-parse --short HEAD)

# Login to registry
docker login $REGISTRY -u $DOCKER_USER -p $DOCKER_PASSWORD

# Build and push all services
for service in "${SERVICES[@]}"; do
    echo "Processing $service..."

    # Build service
    docker build -t $REGISTRY/$service:$TAG \
                 -f ./$service/Dockerfile \
                 ./$service

    # Push to registry
    docker push $REGISTRY/$service:$TAG
done

# Update Kubernetes deployments
if [ "$ENVIRONMENT" = "production" ]; then
    echo "Updating Kubernetes deployments..."

    for service in "${SERVICES[@]}"; do
        kubectl set image deployment/$service \
                $service=$REGISTRY/$service:$TAG
    done

    # Wait for rollout
    for service in "${SERVICES[@]}"; do
        kubectl rollout status deployment/$service
    done
fi
Using Deployment Scripts with DeployHQ
DeployHQ makes it easy to manage and execute deployment scripts across your projects. Here's how to integrate your scripts:

Basic Configuration
# Settings to configure on DeployHQ for nodejs projects
scripts:
  pre_deployment:
    - npm install
    - npm run build

  deployment:
    - ./docker-deploy.sh

  post_deployment:
    - ./health-check.sh
Docker-Specific Configuration
# Settings to configure on DeployHQ for docker projects
scripts:
  pre_deployment:
    - docker login $DOCKER_REGISTRY -u $DOCKER_USER -p $DOCKER_PASSWORD

  deployment:
    - docker-compose build
    - docker-compose push
    - docker-compose down
    - docker-compose up -d

  post_deployment:
    - ./verify-deployment.sh
Available Features in DeployHQ
Script versioning
Environment-specific scripts
Execution logs
Script testing
Integration with version control
Automatic rollbacks
Docker registry integration
Best Practices and Tips
Version Control
# .gitignore
.env
node_modules/
dist/

# Don't ignore deployment scripts
!scripts/deploy.sh
!docker-compose.yml
Docker-Specific Best Practices
1-Image Tagging Strategy

# Use git commit hash and environment
TAG="${GIT_COMMIT:-$(git rev-parse --short HEAD)}"
ENV_TAG="$ENVIRONMENT-$TAG"
docker tag $IMAGE_NAME:$TAG $IMAGE_NAME:$ENV_TAG
2- Clean Up Old Images

# Keep only last 5 images
cleanup_old_images() {
    docker images | grep $IMAGE_NAME | \
    sort -r | awk 'NR>5 {print $3}' | \
    xargs -r docker rmi
}
3- Resource Management

docker run \
    --memory="512m" \
    --memory-swap="1g" \
    --cpus="0.5" \
    --log-driver json-file \
    --log-opt max-size=10m \
    --log-opt max-file=3 \
    $IMAGE_NAME:$TAG
Troubleshooting and Debugging
Common Issues and Solutions
1- Permission Errors

# Fix permissions
chmod +x deploy.sh
chown -R deploy:deploy /var/www/app
2- Docker Issues

# Check Docker logs
docker logs $CONTAINER_NAME

# Check Docker container status
docker ps -a

# Inspect container details
docker inspect $CONTAINER_NAME

# Clean up Docker system
docker system prune -f
3- Network Issues

# Check container networking
docker network ls
docker network inspect bridge

# Test container connectivity
docker exec $CONTAINER_NAME ping database
Health Checks
#!/bin/bash
# health-check.sh

check_service() {
    local service_url=$1
    local max_retries=30
    local wait_time=10

    echo "Checking service: $service_url"

    for ((i=1; i<=$max_retries; i++)); do
        if curl -sf "$service_url/health"; then
            echo "Service is healthy!"
            return 0
        fi

        echo "Attempt $i of $max_retries: Service not ready, waiting..."
        sleep $wait_time
    done

    echo "Service health check failed after $max_retries attempts"
    return 1
}

# Check main application
check_service "http://localhost:3000"

# Check additional services
check_service "http://localhost:3001"  # API
check_service "http://localhost:3002"  # Worker
Conclusion
Deployment scripts are essential tools for modern development workflows, especially when working with containerised applications. When properly implemented, they can significantly improve your deployment process's reliability and efficiency. With DeployHQ, you can easily manage and execute these scripts while taking advantage of advanced features like automatic rollbacks and environment-specific configurations.

Key Takeaways
Use version control for all deployment scripts
Implement proper error handling and logging
Follow Docker best practices for container management
Regularly test and update deployment scripts
Leverage DeployHQ's features for automated deployments
Implement comprehensive health checks
Maintain proper security practices
Ready to streamline your deployment process? Sign up for DeployHQ today and experience the power of automated deployments.

This post is part of our "What Is" series, helping developers understand key concepts and methodologies in modern software development.

Tell us how you feel about this post?

0

0

0

0

0
Enjoy this? Please help us by sharing it…
Twitter
Facebook
LinkedIn
A little bit about the author
Facundo is the CTO at DeployHQ. He oversees our software engineering team by day and, in his free time, enjoys hobbies such as cycling, spending time in nature, and the company of Bono 🐶

More posts
About DeployHQ
logo
DeployHQ is a code deployment service that makes it super easy to automate deploying projects from Git, SVN and Mercurial repositories.
Start your 10 day free trial
Footer
Secondary Navigation
DeployHQ
Welcome
Features
Pricing
What people say
Blog
Help
Features
Zero Downtime Deployments
Build Pipelines
Deployment Targets
Automatic Deployments
Deployment Templates
Deploy Behind Firewalls
Powerful Integrations
DeployHQ AI
Solutions
Deploy from Github
Deploy from Bitbucket
Deploy from Gitlab
Deploy with Slack Shopify
Deploy Wordpress Apps
Deploy Shopify Apps
Other bits & bobs
Guides & tutorials
Terms of Service
Privacy Policy
Service Status
Changelog & Updates
Follow us on X
DeployHQ
© 2025 saas.group Inc. All rights reserved.

Tree
Proudly powered by Katapult.
Running on 100% renewable energy.
echo "Building site..."
bundle exec jekyll build --trace
