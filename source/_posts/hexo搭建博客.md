---
title: 博客搭建
categories: 博客搭建
---
---
<!--more-->
- 1.下载node.js
   [下载地址](https://nodejs.org/en/)

- 2.下载Git
   [下载地址](https://git-scm.com/)

- 3.安装Hexo
   - [官方Api](https://hexo.io/zh-cn/)
   - 在新的文件夹右键  Git Bash Here
   - 在Git中输入 npm install -g hexo-cli
   - hexo init
   - npm install

- 4.更换主题(本人使用NexT主题,[NexT](https://github.com/theme-next/hexo-theme-next))
   - [主题下载](https://hexo.io/themes/)
   - 更换主题：到根目录 _config.yml 找到 theme 

- 5.更改语言
   - 到根目录 _config.yml 将 language: 改为 zh-CN

- 6.增加标签和分类页
   在主题配置文件找到 Menu Settings 将要打开的功能去掉#

- 7.更换头像
   在主题配置文件找到 avatar 将url更改

- 8.更改标题和作者
   站点配置文件Ctrl+F 搜索title，author将其更改

- 9.启用社交链接
   在主题配置文件找到 social 将需要的功能打开，也可以自行添加

- 10.打开打赏功能
   在主题配置文件找到 reward_settings 将false 改为true
   找到 reward 更改图片地址

- 11.打开订阅公众号
   在主题配置文件找到 wechat_subscriber 将false 改为true

- 12.添加动态背景
   在主题配置文件找到 canvas_nest 将 enable: false更改为 true
   可能需要下载库[链接](https://github.com/theme-next/theme-next-canvas-ribbon)

- 13.设置阅读全文
   - 1.打开source 在文章中加入< !--more-->(无空格)
   - 2.在主题配置文件找到 auto_excerpt 将false 改为true ，length自行调节

- 14.添加评论,搜索，统计，分享，字数统计，阅读市场功能(可参照NexT使用文档)
   [NexT使用文档](http://theme-next.iissnan.com/)

- 15.部署到Github(可参照NexT使用文档)