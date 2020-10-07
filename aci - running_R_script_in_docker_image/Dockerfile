# Base image https://hub.docker.com/_/r-base
FROM r-base:latest


## 01/06 create directories
RUN mkdir -p /maran


## 02/06 copy files and directories
COPY /maran/. /maran

## 03/06 Install java jdk/jre latest (Required for R package)
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y default-jre && \
    apt-get install -y default-jdk && \
    apt-get clean;

## 04/06 Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

## 05/06 install R-packages
RUN Rscript /maran/02_code/install_packages.R

## 06/06 RUN Script (Once container start, this command will execute the RScript)
CMD Rscript /maran/02_code/script.R


