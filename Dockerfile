FROM ubuntu:14.04

# Install utilities
RUN apt-get update
RUN apt-get install -y wget python

# Download and unpack Dropbox daemon
ENV HOME /root
WORKDIR /root
RUN wget -q -O - https://www.dropbox.com/download?plat=lnx.x86_64 | tar xzf -

# Install CLI client
wget -O /usr/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py"
chmod +x /usr/bin/dropbox

# Define  mountable directory for content
VOLUME ["/root/Dropbox"]

# Define default command
CMD ["/root/.dropbox-dist/dropboxd"]