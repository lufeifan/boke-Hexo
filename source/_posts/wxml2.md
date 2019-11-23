---
title: 微信小程序(2)
categories: 微信小程序
---
---
<!--more-->
## 自定义组件
#### 组件的创建：json文件
     {
      "component": true    必须有
     }

#### 组件的引用:
        wxml引入同时记得引入wxss

     传值：
     1.传值到组件
          传值 
          例如传 title，
               在组件中:
               properties:{
               title:{
                     type:类型,
                    value:"默认值"
               }
          }
          引用组件的时候:
          添加title="需要传的值”

          样式:
               组件使用：
                    externalClass['titleClass']
                    在需要改变样式的标签添加 titleClass
               外部使用组件时只需要传入: titleClass="样式class"

          标签:slot

     2.组件值的传出(通过自定义组件)
          组件内部：     
          bind:tap="方法名"
          methods:{
               方法名(){
                    this.triggerEvent('increment',{需要传出去的值},{})
               }
          }
          组件外部：bind:increment="方法名"
          方法名(event){
               传出来的的都在event里
          }


#### 怎么使用组件：
    需要注册组件 
     "usingComponents": {
        "组件标签":"路径"
    }