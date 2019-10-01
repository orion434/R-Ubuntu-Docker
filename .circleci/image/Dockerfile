# Pull base image.
#FROM ubuntu:latest
FROM rocker/r-ubuntu:18.04 
# To install, use the explicit LTS tag---currently 18.04---when pulling
# https://hub.docker.com/r/rocker/r-ubuntu

# git ssh tar gzip ca-certificates are needed for circleci : https://circleci.com/docs/2.0/custom-images/#required-tools-for-primary-containers
RUN \
  apt-get update -qq \
  && apt-get install -y -qq --no-install-recommends sudo apt-utils cmake \
         git ssh tar gzip ca-certificates
#   && libnetcdf-c++4-dev netcdf-bin libnetcdf-dev libgsl-dev \
#   && netcdf-bin libssl-dev \
#   && libboost-all-dev \
#   && libxml2-dev

#USER root

# Install.
# RUN \
#   sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
#   apt-get update && \
#   apt-get -y upgrade && \
#   apt-get install -y build-essential && \
#   apt-get install -y software-properties-common && \
#   apt-get install -y byobu curl git htop man unzip vim wget && \
#   rm -rf /var/lib/apt/lists/*

# # Add files.
# ADD root/.bashrc /root/.bashrc
# ADD root/.gitconfig /root/.gitconfig
# ADD root/.scripts /root/.scripts

# # Set environment variables.
# ENV HOME /root

# # Define working directory.
# WORKDIR /root

# From : https://hub.docker.com/r/rocker/r-ubuntu/dockerfile
#
# Now install R and littler, and create a link for littler in /usr/local/bin
# Default CRAN repo is now set by R itself, and littler knows about it too
# r-cran-docopt is not currently in c2d4u so we install from source
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
                 littler \
 		 r-base \
 		 r-base-dev \
 		 r-recommended \
  	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
 	&& install.r docopt \
 	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
 	&& rm -rf /var/lib/apt/lists/*

# Define default command.
CMD ["bash"]




# https://hub.docker.com/r/rocker/r-ubuntu/dockerfile
# https://hub.docker.com/r/rocker/tidyverse/dockerfile
# https://hub.docker.com/r/rocker/rstudio/dockerfile

## rocker/tidyverse
#
# FROM rocker/rstudio:3.6.1
# RUN apt-get update -qq && apt-get -y --no-install-recommends install \
#   libxml2-dev \
#   libcairo2-dev \
#   libsqlite3-dev \
#   libmariadbd-dev \
#   libmariadb-client-lgpl-dev \
#   libpq-dev \
#   libssh2-1-dev \
#   unixodbc-dev \
#   libsasl2-dev \
#   && install2.r --error \
#     --deps TRUE \
#     tidyverse \
#     dplyr \
#     devtools \
#     formatR \
#     remotes \
#     selectr \
#     caTools \
#     BiocManager