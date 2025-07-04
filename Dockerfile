FROM nikolaik/python-nodejs:python3.9-nodejs16

# Updating Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Copying Requirements
COPY requirements.txt /requirements.txt

# Installing Requirements
RUN pip3 install --upgrade pip
RUN pip3 install -U -r /requirements.txt

# Creating Working Directory
RUN mkdir /MusicPlayer
WORKDIR /MusicPlayer

# Copying Startup Script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Running Music Player Bot
CMD ["/bin/bash", "/startup.sh"]
