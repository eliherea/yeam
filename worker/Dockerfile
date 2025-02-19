FROM node:latest

WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/handipradana/nodejsbasic.git .
RUN apt-get install -y nfs-common

# Set environment variables via build arguments

# Install PM2 and application dependencies
RUN npm install -g pm2 && npm install

# Create mount point for EFS
RUN mkdir -p /mnt/efs

# Expose application port
EXPOSE 8000

# Command to mount EFS and start application
CMD ["sh", "-c", "mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0f0357f157fbf3b7d.efs.us-east-1.amazonaws.com:/ /mnt/efs", "pm2-runtime", "npm", "--"," run start-prod"]
