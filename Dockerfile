FROM ubuntu:22.04

ENV GMT_VERSION=6.5.0
ENV GSHHG_VERSION=2.3.7
ENV DCW_VERSION=2.1.1

ENV GSHHG_ROOT=/root/gshhg-gmt-$GSHHG_VERSION
ENV DCW_ROOT=/root/dcw-gmt-$DCW_VERSION

RUN apt update && apt upgrade -y
RUN apt install wget git cmake build-essential curl libcurl4-gnutls-dev libnetcdf-dev libgdal-dev libfftw3-dev libpcre3-dev liblapack-dev libblas-dev imagemagick -y

RUN cd /root/ && wget http://www.soest.hawaii.edu/pwessel/gshhg/gshhg-gmt-2.3.7.tar.gz
RUN cd /root/ && wget ftp://ftp.soest.hawaii.edu/dcw/dcw-gmt-2.1.1.tar.gz

RUN cd /root/ && tar -xvf gshhg-gmt-$GSHHG_VERSION.tar.gz
RUN cd /root/ && tar -xvf dcw-gmt-$DCW_VERSION.tar.gz

RUN cd /root/ && git clone -b $GMT_VERSION --single-branch https://github.com/GenericMappingTools/gmt.git

RUN mkdir -p /root/gmt/build
RUN cd /root/gmt/build/ && cmake GSHHG_ROOT=$GSHHG_ROOT DCW_ROOT=$DCW_ROOT DCW_VERSION=$DCW_VERSION GSSHG_VERSION=$GSSHG_VERSION .. && make -j8 && make install

RUN sed -i '/disable ghostscript format types/,+6d' /etc/ImageMagick-6/policy.xml

RUN mkdir -p /usr/src/myapp

ARG HOME=/usr/src/myapp

# 设置工作路径
WORKDIR ${HOME}

CMD ["/bin/bash"]
