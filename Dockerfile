FROM ubuntu:16.04
MAINTAINER Henry Rodman <henry.rodman@gmail.com>

# Add CRAN repo to sources.list and add key
# From - https://cran.r-project.org/bin/linux/ubuntu/README
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> \
    /etc/apt/sources.list'
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

# Install system packages
RUN apt-get update && \

    # we have to add the ubuntugis repo for
    # newer version of gdal
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntugis/ppa && \
    add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update && \
    apt-get install -y \
    ack-grep \
    git \
    grass \
    libgdal-dev \
    libproj-dev \
    libspatialindex-dev \
    libssl-dev \
    libudunits2-dev \
    nano \
    pandoc \
    python-dev \
    python-gdal \
    unzip \
    r-base-core \
    saga \
    sudo \
    texlive-latex-base \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get latest version of pip, configure jupyter
RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && python -m pip install ipykernel \
    && python -m ipykernel install --user \
    && pip install jupyter

RUN mkdir -p /opt/setup_config
ADD docker/install_r_dependencies.R /opt/setup_config/

RUN echo 'cache = broken'
RUN Rscript /opt/setup_config/install_r_dependencies.R
