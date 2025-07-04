FROM nikolaik/python-nodejs:python3.9-nodejs16

# Updating Packages
RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y

# Creating Working Directory
RUN mkdir /MusicPlayer
WORKDIR /MusicPlayer

# Copying Local Files
COPY . /MusicPlayer

# Installing Requirements
RUN pip3 install --upgrade pip
RUN pip3 install -U -r requirements.txt

# Make Startup Executable
RUN chmod +x startup.sh

# Run Script
CMD ["bash", "startup.sh"]
