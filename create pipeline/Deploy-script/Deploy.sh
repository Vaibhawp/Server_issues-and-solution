#!/bin/bash

# Step 1: Navigate to the project directory
cd /home/ubuntu/ECHO/echoai.project

# Step 2: Deploy the frontend service (rebuild and start without affecting others)
echo "Rebuilding and starting frontend service..."
docker compose up  --build -d 

# Step 3: Check if Docker Compose deployment was successful
if [ $? -eq 0 ]; then
    echo "Frontend service deployed successfully."

    # Step 4: Run docker exec to ensure the build process is complete inside the container
    echo "Waiting for build process inside the container to complete..."
    docker exec -it echoaiproject-echoai_frontend-1 sh -c "cd /app && ls -l build"  # Check if build folder exists

    # Step 5: Copy the build folder from the container to the host machine
    echo "Copying build folder from container to host..."
    docker cp echoaiproject-echoai_frontend-1:/app/build ./frontend/build

    # Step 6: Remove the existing build folder in S3 (replace with echoaistatic bucket)
    echo "Removing existing build folder from S3..."
    aws s3 rm s3://echoaistatic/build/ --recursive

    # Step 7: Upload the new build folder to S3
    echo "Uploading the new build folder to S3..."
    aws s3 cp ./frontend/build s3://echoaistatic/build/ --recursive
    echo "Build folder uploaded to S3."
else
    echo "Docker Compose deployment failed. Skipping S3 upload."
fi

