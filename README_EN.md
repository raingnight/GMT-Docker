# GMT-Docker
# [GenericMappingTools](https://github.com/GenericMappingTools/gmt.git) Docker Images

## [中文](README.md)

**Base image:** Ubuntu 22.04

**GMT version:** 6.5.0

**images:** 

​	[GMT6.5.0_CN_x86_64](https://hub.docker.com/r/fangmr999/gmt_cn_amd64:6.5.0)	

​	[GMT6.5.0_CN_arm64](https://hub.docker.com/r/fangmr999/gmt_cn_arm64:6.5.0)

**image with jdk21**	

​	[GMT6.5.0_CN_JDK21 x86_64](https://hub.docker.com/r/fangmr999/jdk21_gmt_cn_6.5.0))

If you need to change or add anything , you modify  `Dockerfile` and build image by yourself 

## usage:

1、clone this repository to your server

```shell
git clone https://github.com/raingnight/GMT-Docker.git
```

2、build docker images

```
docker build --platform linux/arm64 -t gmt_arm64:6.5.0 .
```



