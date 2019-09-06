# Largely copied from: https://github.com/sagemath/docker-images/blob/master/sagemath-base/Dockerfile
FROM ubuntu:bionic

# Update and install build dependencies
# http://doc.sagemath.org/html/en/installation/source.html
RUN apt-get update -qq
RUN apt-get install -y binutils pixz gcc g++ gfortran make m4 perl tar \
  git patch openssl libssl-dev libz-dev bc libbz2-dev liblzma-dev libgmp-dev \
  libffi-dev libgf2x-dev libcurl4-openssl-dev curl yasm
RUN apt-get install -y libntl-dev libmpfr-dev libmpc-dev libflint-dev \
  libpcre3-dev libgd-dev \
  cmake libterm-readline-gnu-perl ninja-build librw-dev

# Add a sage user
RUN adduser --quiet --shell /bin/bash --gecos ",,," --disabled-password sage

# Use the sage user 
USER sage
