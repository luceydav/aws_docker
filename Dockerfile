FROM rocker/verse:latest
RUN install2.r --error \
    --deps TRUE \
    reticulate \
    data.table \
    janitor
RUN apt-get purge -y python \
    && apt-get autoremove -y \
    && apt-get update && apt-get install -y \
       python3 python3-dev python3-pip \
    && pip3 install numpy scikit-learn \
    && ln -s /usr/bin/python3 /usr/bin/python
CMD ["/init"]
