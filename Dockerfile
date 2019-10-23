FROM rocker/rstudio:latest
RUN apt-get install -y 
		python3-pip 
		python3-dev 
	&& pip3 install virtualenv
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && 
    wget --quiet https://repo.continuum.io/archive/Anaconda2-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && 
    /bin/bash ~/anaconda.sh -b -p /opt/conda && 
    rm ~/anaconda.sh
ENV "PATH"="opt/conda/bin:$PATH"
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite-dev \
  libmariadbd-dev \
  libmariadbclient-dev \
  libpq-dev \
  libssh2-1-dev \
  && install2.r --error \
    --deps TRUE \
    pander \
    rmarkdown \
    knitr \
    reticulate \
    data.table \
    ggplot2 \
    lubridate \
    stringr \
    janitor \
    h2o \ 
    devtools \
    formatR \
    remotes
