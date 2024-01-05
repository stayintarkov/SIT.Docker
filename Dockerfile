##
## bullet's SIT LINUX Container
##

FROM ubuntu:latest AS builder
ARG SPT
WORKDIR /opt

# Install git git-lfs curl
RUN apt update && apt install -yq git git-lfs curl
# Install Node Version Manager and NodeJS
RUN git clone https://github.com/nvm-sh/nvm.git $HOME/.nvm || true && cd $HOME/.nvm 
RUN \. $HOME/.nvm/nvm.sh && nvm install 20.10.0
## Clone the SPT AKI repo or continue if it exist
RUN git clone --branch master https://dev.sp-tarkov.com/SPT-AKI/Server.git srv || true

## Check out and git-lfs (specific commit --build-arg SPT=xxxx)
WORKDIR /opt/srv/project 
RUN git checkout $SPT || true
RUN git-lfs fetch --all && git-lfs pull

## Install npm dependencies and run build
RUN \. $HOME/.nvm/nvm.sh && npm install && npm run build:release

## Move the built server and clean up the source
RUN mv build/ /opt/server/
WORKDIR /opt
RUN rm -rf srv/
## Grab SIT Coop Server Mod or continue if it exist
RUN git clone https://github.com/stayintarkov/SIT.Aki-Server-Mod.git ./server/user/mods/SITCoop || true 
RUN rm -rf ./server/user/mods/SITCoop/.git

## Run server for 27s to generate configs
# RUN cd server/ && timeout --preserve-status 27s ./Aki.Server.exe || true
# RUN sed -i 's/127.0.0.1/0.0.0.0/g' server/Aki_Data/Server/configs/http.json

FROM ubuntu:latest
WORKDIR /opt/
RUN apt update && apt upgrade -yq && apt install dos2unix
COPY --from=builder /opt/server /opt/srv
COPY bullet.sh /opt/bullet.sh
# Fix for Windows
RUN dos2unix /opt/bullet.sh

# Exposing ports (opening them to 0.0.0.0)
EXPOSE 6969
EXPOSE 6970

# Specify the default command to run when the container starts
CMD bash ./bullet.sh
