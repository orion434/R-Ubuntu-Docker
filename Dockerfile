# Pull base image.
# To install, use the explicit LTS tag---currently 18.04---when pulling
# https://hub.docker.com/r/rocker/r-ubuntu
FROM rocker/r-ubuntu:18.04 


ARG BUILD_DATE
ARG VCS_REF
# ARG IMG_DIST
# ARG BUILD_VERSION

# Labels.
LABEL maintainer="Gian Luigi Somma"
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.name = "R-Ubuntu-Docker"
LABEL org.label-schema.description = "A Ubuntu LTS Docker with R"
LABEL org.label-schema.vcs="https://github.com/orion434/R-Ubuntu-Docker"

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-ref=$VCS_REF 
#LABEL org.label-schema.version = $BUILD_VERSION

# git ssh tar gzip ca-certificates are needed for circleci : https://circleci.com/docs/2.0/custom-images/#required-tools-for-primary-containers
RUN \
  apt-get update -qq && \\
  apt-get upgrade -y -qq --no-install-recommends && \\
  apt-get install -y -qq --no-install-recommends apt-utils

RUN \  
  apt-get update -qq && \
  apt-get install -y -qq --no-install-recommends \
    ca-certificates \
    cmake \
    git \ 
    gzip \
    libboost-all-dev \
    libgsl-dev \
    libnetcdf-c++4-dev \
    libnetcdf-dev \
    libssl-dev \
    libxml2-dev \
    netcdf-bin \
    ssh \
    subversion \
    sudo \
    tar  \
  && \  
  apt-get autoremove -y && \
  apt-get clean  \
  && rm -rf /var/lib/apt/lists/*
# Last lines delete temporary files and cache

RUN \
    Rscript -e 'install.packages("devtools")'

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
# RUN apt-get update \
#         && apt-get install -y --no-install-recommends \
#                  littler \
#  		 r-base \
#  		 r-base-dev \
#  		 r-recommended \
#   	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
#  	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
#  	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
#  	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
#  	&& install.r docopt \
#  	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
#  	&& rm -rf /var/lib/apt/lists/*

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