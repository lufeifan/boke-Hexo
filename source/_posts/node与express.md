---
title: node与express在centos的安装
categories: 后台
---
---
<!--more-->
#### 安装node
    下载
    curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
    安装
    yum -y install nodejs
    查看是否安装成功
    node -v
    创建工作目录
    mkdir -p /data/release/hello
    进入工作目录
    cd /data/release/hello
    初始化
    npm init
    安装 Express 并将其保存到依赖列表中：
    npm install express --save
#### 安装express框架
    npm install express-generator -g
    cd /data/release
    express myapp
    cd myapp
    npm install
    DEBUG=myapp npm start
#### 开放3000端口 
阿里云此命令无效，需要到控制台配置安全组，开放你想要的端口号
/sbin/iptables -I INPUT -p tcp --dport 3000 -j ACCEPT
#### pm2启动express项目
    安装pm2
    npm install pm2 -g
    start 后面接文件的位置，name名称
    pm2 start app.js --name="xxx"
    pm2 save
    pm2 startup
#### pm2指令
   pm2 restart all               # 重启所有应用
   pm2 stop 0                    # 停止 id为 0的指定应用程序
   pm2 stop all                  # 停止所有的应用程序
   pm2 delete all                # 关闭并删除所有应用
   pm2 delete 0                  # 删除指定应用 id 0
   pm2 list                      # 列表 PM2 启动的所有的应用程序