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

RUN cd /root/ && rm -rf dcw-gmt-2.1.1 dcw-gmt-2.1.1.tar.gz gshhg-gmt-2.3.7 gshhg-gmt-2.3.7.tar.gz

# GMT中文支持
RUN mkdir -p /root/.gmt/winfonts
ADD SIMFANG.TTF /root/.gmt/winfonts/
ADD SIMHEI.TTF /root/.gmt/winfonts/
ADD SIMKAI.TTF /root/.gmt/winfonts/
ADD SIMSUN.TTC /root/.gmt/winfonts/
ADD cidfmap  /root/.gmt/
ADD PSL_custom_fonts.txt /root/.gmt/

# JDK17
RUN apt-get install openjdk-21-jdk -y

# 设置时区
ENV TZ="Asia/Shanghai"

RUN mkdir -p /usr/src/myapp

ARG HOME=/usr/src/myapp

# 设置环境变量，默认值为 java.jar
ENV JAR_NAME="java.jar"

# 设置工作路径
WORKDIR ${HOME}

# 根据环境变量指定的 jar 包的名称启动容器
#CMD ["/bin/bash"]
ENTRYPOINT java -Djava.security.egd=file:/dev/./urandom -jar ${JAR_NAME}
