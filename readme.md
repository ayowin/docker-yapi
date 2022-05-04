[toc]



# yapi

docker部署yapi



# 1. 下载源码

```shell
git clone https://github.com/ayowin/docker-yapi
```



# 2. 构建

```shell
cd docker-yapi
docker build -t yapi:latest .
```



# 3. 启动

```shell
docker run -d --name yapi -p 9090:9090 -p 3000:3000 yapi
```



# 4. 部署初始化服务

* 正常使用yapi前，需先初始化

```shell
docker exec -it yapi /bin/bash
yapi server

# 初始化操作：
# 	1. http://{ip}:9090
#	2. 选择yapi版本，经测试，应该是由于历史原因，有些版本初始化会报失败，遇到初始化失败，选择其他版本初始化即可，小编选择的是1.10.2

# 等待初始化完成后，yapi已成功安装。即：可退出此初始化服务，且以后无需再初始化
```



# 5. 启动yapi服务

* 初始化成功后，可直接启动yapi服务即可

```shell
docker exec -it yapi /bin/bash
node /my-yapi/vendors/server/app.js

# 登录
# 	用户名：初始化时配置的管理员邮箱，默认admin@admin.com
#	密码：ymfe.org

# 保持服务并离开当前docker进程
#	先按下ctrl+p，再按下ctrl+q即可
```

