---
title: vue搭建博客 
categories: 博客搭建
---
---
<!--more-->
#### 安装vue-cli 脚手架
    1.npm install vue-cli -g
    全局安装vue-cli脚手架
    2.vue init webpack boke
    使用vue-cli搭建一个vue2.0项目
    安装 集成的功能
    3.npm run dev
    启动vue项目
#### 安装elemen-ui
    npm i element-ui -S
    在 main.js 中写入以下内容：
        import ElementUI from 'element-ui';
        import 'element-ui/lib/theme-chalk/index.css';
        Vue.use(ElementUI);
#### 小图标使用
    https://www.iconfont.cn/?spm=a313x.7781069.1998910419.d4d0a486a

    <i class="iconfont icon-xxx"></i>
#### 前端搭建
    1.确定布局，想好哪里需要全局不变和局部变化，在局部变化中添加<router-view></router-view>
    2.响应式设置：@media only screen and (max-width: 1200px){}
    3.设置默认首页显示 : 
    在index 路由中：
     {
      // 默认显示首页
      path: "/",
      redirect: "/home"
    },
    4.路由跳转的方式
        1.<router-link :to="/路径">
        2.绑定方法在方法中使用
        this.$router.push({ path: "/home" });
    5.通过路由跳转时传递数据
    例如：
    <div class="art" v-for="(blog,index) in showblogs" :key="index">
      <router-link :to="{name:'detail', params:{id:blog}}">{{blog.title}}</router-link>
    </div>
    其中params:{id:blog}}就是传递数据给id
    6.设置返回顶部
    <link rel="stylesheet" href="//at.alicdn.com/t/font_1467101_j4hdn7rmux.css" />
    <div class="rocket">
        <a href="javascript: void(0)" @click="backTop">
            <i class="iconfont icon-fanhuidingbu1"></i>
        </a>
    </div>
    样式：
        .rocket {
            position: fixed;
            right: 30px;
            bottom: 40px;
            box-shadow: 0 0 5px rgb(189, 163, 163);
            line-height: normal;
        }
        .rocket i {
            font-size: 30px;
            display: inline-block;
        }
    js:
     backTop: function() {
      document.documentElement.scrollTop = 0;
      document.body.scrollTop = 0;
    }
    7.页面跳转时滚动条的调整设置回到顶部
    在  created(){
        添加
            document.documentElement.scrollTop = 0;
            document.body.scrollTop = 0;
        }
    8.组件传参数
    http://www.lululua.cn/2019/10/26/vue/

#### 后端搭建