FROM ubuntu:16.04
MAINTAINER Henry Rodman <henry.rodman@gmail.com>

# Add CRAN repo to sources.list and add key
# From - https://cran.r-project.org/bin/linux/ubuntu/README
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> \
    /etc/apt/sources.list'
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
