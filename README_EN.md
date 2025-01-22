# GMT-Docker
# [GenericMappingTools](https://github.com/GenericMappingTools/gmt.git) Docker Images

## [中文](README.md)

**Base image:** Ubuntu 22.04

**GMT version:** 6.5.0

**images:** 

​	[gmt_cn](https://hub.docker.com/r/fangmr999/gmt_cn)	

If you need to change or add anything , you modify  `Dockerfile` and build image by yourself 

## how to build image:

1、clone this repository to your server

```shell
git clone https://github.com/raingnight/GMT-Docker.git
```

2、build docker images

```
docker build --platform linux/arm64 -t gmt_arm64:6.5.0 .
```



## how to use image：

1、pull image

```shell
docker pull fangmr999/gmt_cn:latest
```

2、start container

```shell
docker run -it --rm fangmr999/gmt_cn /bin/bash
```

3、test GMT command

```shell
gmt --version
```

**Tips**

The default work path of  this image is:

```shell
/usr/src/myapp
```



### 使用截图

![GMT使用截图](D:\user_data\Github\GMT-Docker\gmt_use.jpg)
