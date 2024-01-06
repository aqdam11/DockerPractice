# Use a base image with Ubuntu
FROM ubuntu:latest

# Install necessary packages and dependencies
RUN apt-get update && \
    apt-get install -y \
    nginx \
    openjdk-11-jdk \
    wget \
    git \
    gnupg2   # Install GnuPG package

# Install Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add - && \
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && \
    apt-get install -y jenkins

# Expose ports
EXPOSE 80 8080

# Set up Nginx
RUN mkdir -p /var/www/html

# Clone HTML files from GitHub repository
RUN git clone https://github.com/aqdam11/Deploying-Website-to-Azure-VM.git /tmp/html && \
    cp -r /tmp/html/* /var/www/html/

# Clean up temporary files
RUN rm -rf /tmp/html

# Start Nginx and Jenkins services
CMD service nginx start && service jenkins start && tail -f /dev/null