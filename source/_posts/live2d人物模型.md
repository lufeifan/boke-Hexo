---
title: 人物模型 
categories: 博客搭建
---
---
<!--more-->
1.站点配置文件下Git运行:npm install --save hexo-helper-live2d
2.站点配置文件写下（主题配置文件下不生效）：
```
# 添加萌妹子效果
live2d:
  enable: true
  scriptFrom: local  
  model:
    use: live2d-widget-model-wanko    //模型名字
  display:    
    position: right   //位置
    width: 150    //妹子宽度
    height: 300    //妹子高度
  mobile:
    show: true
```
更多模型：https://github.com/xiazeyu/live2d-widget-models
更换模型 npm install 模型名称