---
title: 微信小程序(1)
categories: 微信小程序
---
---
<!--more-->
#### 目录结构
    pages
        index
            index.js    Pages({})
            index.json  可以设置顶部文字和颜色
            index.wxml  相当于html
            index.wxss  相当于css
    app.js
    app.json    导入页面的文件
    app.wxss    设置全局样式

#### 设置顶部 
    "navigationBarTitleText": "String" 顶部文字
    "navigationBarBackgroundColor": "color", 顶部颜色
    "navigationBarTextStyle": "black" 仅支持白色和黑色
    "enablePullDownRefresh": false, //是否开启下拉刷新

#### 幻灯片
    在swiper标签加swiper-item，swiper-item就是每一页的内容
    幻灯片小圆点:indicator-dots="true"
    current,记录当前页面的index

#### scroll-view
     添加 scroll-x就可看到滑动

#### 理解display
     display: flex;
     display: inline-block;

#### view 
     属性：flex-direction:row/column 行或列

问题：
white-space: nowrap;
 justify-content: center;