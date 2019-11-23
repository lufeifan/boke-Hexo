---
title: 服务器安装mongodb
categories: 后台
---
---
<!--more-->
#### 安装
	https://cloud.tencent.com/developer/article/1353021
#### 使用
	https://www.runoob.com/mongodb/mongodb-tutorial.html
#### 本地电脑连接云服务器的mongodb
	阿里云服务器需要去配置安全组规则，开放27017端口
	打开配置文件修改bind_ip=127.0.0.1注释掉
	sudo vi /etc/mongod.conf
	重启mongodb
	sudo systemctl stop mongod
	sudo systemctl start mongod