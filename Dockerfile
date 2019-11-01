FROM rocker/rstudio:latest
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
    devtools \
    formatR \
    remotes
RUN apt-get purge -y python \
    && apt-get autoremove -y \
    && apt-get update && apt-get install -y \
       python3 python3-dev python3-pip \
    && pip3 install numpy scikit-learn \
    && ln -s /usr/bin/python3 /usr/bin/python
CMD ["/init"]
