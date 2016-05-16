FROM ubuntu:14.04

# Add user "dropbox" with home directory so we don't have to run Dropbox as root
RUN adduser --uid 1000 --group --system dropbox

# Install utilities
RUN apt-get update
RUN apt-get install -y wget

# Download and unpack Dropbox daemon
USER dropbox
ENV HOME /home/dropbox
WORKDIR /home/dropbox
RUN wget -q -O - https://www.dropbox.com/download?plat=lnx.x86_64 | tar xzf -

# Define  mountable directory for content
VOLUME ["/home/dropbox/Dropbox"]

# Define default command
CMD ["/home/dropbox/.dropbox-dist/dropboxd"]