---
title: Git服务器
categories: 博客搭建
---
---
<!--more-->
#### 1.从本地导出.git文件夹
    git clone --bare my_project my_project.git
    my_project:  .git结尾的文件
    my_project.git: 生成的文件
#### 2.放到远程服务器上
    $ scp -r my_project.git 用户名@服务器ip:/home/放到服务器的文件位置

#### 3.在服务器上下载上传的文件
    安装git:  yum install -y git
    创建用户：useradd 用户名
    用户密码：password 用户密码
    su 用户名// 这步很重要，不切换用户后面会很麻烦
    创建新的文件夹
    在文件夹里 执行 git init --bare，git init --bare --shared
    下载 git clone 用户名@服务器ip:/home/放到服务器

遇到的问题：
    Git无法访问：解决办法找到本地计算机的.ssh文件，找到known_hosts删除你服务器的记录
    权限：
    