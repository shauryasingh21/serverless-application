##This is just Demo project that will display index.html file content
#import base image
FROM mcr.microsoft.com/dotnet/sdk:6.0:latest

#switch user to root
#USER root


#Update the old package from the image
#RUN yum update kernel -y
#RUN yum update -y


#switch user back
USER root

#Set stage info passed from pipeline
ARG STAGE
RUN echo $STAGE

#Move your working dir to home dir
COPY index.html /var/www/index.html

#Add bootstrap to run httpd
ADD bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh

#Set env variable port to 8080
ENV PORT 8080

#Expose the port 8080
EXPOSE 8080

WORKDIR /var/www/index.html

RUN echo $UID
RUN echo $GID

CMD ["httpd","-O", "FOREGROUND"]



