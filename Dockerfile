# Base Image selection
FROM public.ecr.aws/amazonlinux/amazonlinux:latest

# Install dependencies packages
RUN yum update -y && \
 yum install -y httpd

# Install apache and write hello world message
RUN echo 'I am babo' > /var/www/html/index.html

# Configure apache
RUN echo 'mkdir -p /var/run/httpd' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/httpd' >> /root/run_apache.sh && \
 echo '/usr/sbin/httpd -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh

# Expose the web port
EXPOSE 80

# Run the web server
CMD /root/run_apache.sh
