# GMT-Docker
# [GenericMappingTools](https://github.com/GenericMappingTools/gmt.git)的 Docker 镜像

## [ENGLISH](README_EN.md)

**基础镜像:** Ubuntu 22.04

**GMT 版本:** 6.5.0

**已构建的镜像:** 

​	[GMT6.5.0_CN_x86_64](https://hub.docker.com/r/fangmr999/gmt_cn_amd64)	

​	[GMT6.5.0_CN_arm64](https://hub.docker.com/r/fangmr999/gmt_cn_arm64)

**安装了JDK21的版本：**	

​	[GMT6.5.0_CN_JDK21 x86_64](https://hub.docker.com/r/fangmr999/jdk21_gmt_cn_6.5.0)

如果你需要更改或者新增什么东西，可以修改`Dockerfile`文件，然后自己重新构建镜像

## 使用方法:

1、克隆这个方法到你的服务器

```shell
git clone https://github.com/raingnight/GMT-Docker.git
```

2、构建Docker镜像

```
docker build --platform linux/arm64 -t gmt_arm64:6.5.0 .
```



