# 说明

从golang 1.1 开始使用go module升级为官方管理库， 其他的项目管理就成为一个问题

本Dockerfile是生成一个gb管理工具，来管理旧项目包

##  build 项目文件

默认的entrypoint 是$(pwd)/build.sh, 如若要使用gb命令的话，可以自行添加 gb 相关的entrypoint

```bash 
docker run --rm -it -v $(pwd):/project kekek/centosgb:v1
```

## gb example

```bash
docker run -v $(pwd):/project --rm  --entrypoint=gb kekek/centosgb:v1 info
```

## build docker image

```bash 
make -e TAG={tag-name} build
```

## 备份 

https://github.com/kekek/gb 
fork form https://github.com/constabulary/gb 

## 

/web/data/docker/images/go/centosgb