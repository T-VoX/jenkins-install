# Grabbing Jenkins....not in a weird way.
FROM jenkins/jenkins:2.403-jdk11

# So I can do all the things....WuHaHaHaHaHa *cough*, *cough*....*cough*
USER root

# Running some updates, because I don't know where this thing has been.
# Also grabbing lsb-release to identify the Linux distribution being used and its compliance with the Linux Standard Base.
RUN apt-get update && apt-get -y install lsb-release

# Verifing stuff...because the voices in my head say that I should.
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# More updates......because, and grabbing the Docker Engine.
RUN apt-get update && apt-get -y install docker-ce-cli

# Creating more friends.
USER jenkins

# Grabbing some plugins to make Jenkins feel pretty, oh, so pretty.
RUN jenkins-plugin-cli --plugins "blueocean:1.27.3 docker-workflow:563.vd5d2e5c4007f"
