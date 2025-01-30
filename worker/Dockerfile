FROM node:latest
RUN apt-get update && apt-get install -y git
WORKDIR /app
RUN git clone https://github.com/dihkaw/showipserverwithnodejs.git .
RUN npm install -g pm2
RUN npm install 
EXPOSE 5000
CMD ["pm2-runtime","index.js"]