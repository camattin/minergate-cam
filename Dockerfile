# Set the base image
FROM ubuntu:latest

# Dockerfile author/maintainer
MAINTAINER Chris Mattingly <camattin@gmail.com>

# Update application repository list
RUN apt-get update

# Install wget and minergate-cli deps
RUN apt-get install -y wget libxcb1 libpcre16-3

# Get minergate-cli
RUN wget -o /dev/null -O minergate.deb https://minergate.com/download/ubuntu && dpkg -i minergate.deb

# Debug
RUN dpkg -L minergate-cli

# Run it
ENTRYPOINT ["minergate-cli"]
CMD ["--user","camattin@gmail.com","--xmr"]
