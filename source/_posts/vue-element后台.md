---
title: 使用express,element,vue搭建后台管理
top: true
---
-----
<!--more-->
#### server,admin文件夹
    server 提供后台服务
    admin 后台管理界面(使用vue create admin创建，npm init 初始化，vue add 模块名)
#### server
    db.js 链接mongodb数据库
    models文件夹 创建数据库Schema，model
    routes -> index.js 提供访问的api
    index.js 使用express对外提供服务
    启动方式 npm run serve (在package.json ->scripts添加"serve": "nodemon index.js",需要添加nodemon模块)
#### db.js:
    module.exports = app => {
    const mongoose = require("mongoose")
    mongoose.connect('mongodb://localhost:27017/node-vue'), {
        useNewUrlParser: true,
        useUnifiedTopology: true
    }
}
#### models文件夹
> 用户账号和密码

    const mongoose = require('mongoose')
    const schema = new mongoose.Schema({
        username: {
            type: String
        },
        password:{
            type: String,
            // 查不出密码
            select:false,
            set(val){
                加密上传的密码
                return require('bcrypt').hashSync(val,10)
            }
        }
    })
    module.exports = mongoose.model('AdminUser', schema)


> 文章标题和内容

    const mongoose = require('mongoose')
    const schema = new mongoose.Schema({
        name: {
            type: String
        },
        body:{
            type: String
        }
    })
    module.exports = mongoose.model('Category', schema)

#### routes -> index.js api
    需要安装的模块 
    jsonwebtoken 用于生成token校验token是否正确
    bcrypt  用于校验密码的正确性
    multer  用于Node.jsmultipart/form-data请求数据处理的中间件。

> 重点：设置接口访问权限和错误处理

    接口访问权限 ：
    在接口路由中在添加一个中间件校验是否拥有token，解密出token中的id是否拥有，通过id去数据库查找是否存在

    错误处理：
    app.use(async (err, req, res, next) => {
        res.status(err.statusCode || 401).send({
            message: err.message
        })
    })
> 登录

    router.post('/login', async (req, res) => {
        获取上传的 username, password
        const { username, password } = req.body
        在数据库查找用户名，并提取加密后密码
        const user = await AdminUser.findOne({ username }).select('+password')

        用户不存在就报错
        if (!user) {
            return res.status(401).send({
                message: '用户不存在'
            })
        }
        校验上传的密码和用户名加密后的密码是否对应
        const isvalid = require('bcrypt').compareSync(password, user.password)

        if (!isvalid) {
            return res.status(401).send({
                message: '密码错误'
            })
        }
        // 返回token，用id生成token，密匙全局变量secret
        const token = jwt.sign({
            id: user._id,
        }, app.get('secret'))
        res.send({ token })
    })
#### index.js
    const express = require("express")
    const app = express()

    设置一个全局变量secret为abcdefg，用于生成token的密匙
    app.set('secret','abcdefg')  
    设置能解析 json
    app.use(express.json())
    设置跨域访问
    app.use(require('cors')())
    文件上传存放目录
    app.use('/uploads',express.static(__dirname+'/uploads'))
    传入app
    require('./routes/admin')(app)
    require('./db/db')(app)

    监听3000端口
    app.listen(3000, () => {
        console.log("http//localhost:3000")
    })
#### admin
> http.js 封装axios请求

    import axios from 'axios'
    import Vue from 'vue'
    import router from './router'

    const http = axios.create({
        常用访问地址
        baseURL: 'http://localhost:3000/admin/api'
    })
    访问时请求头添加Authorization
    http.interceptors.request.use(function (config) {
        if (sessionStorage.token) {
            Authorization为'Bearer ' + sessionStorage.token注意Bearer后面有空格，方便以后用空格断开获取token，sessionStorage关闭网页token清除
            config.headers.Authorization = 'Bearer ' + sessionStorage.token
        }
        return config;
    }, function (err) {
        return Promise.reject(err)
    })
    访问错误处理
    http.interceptors.response.use(res => {
        return res
    }, err => {
        if (err.response.data.message) {
            Vue.prototype.$message({
                type: 'error',
                message: err.response.data.message
            })
        }
        if(err.response.status===401){
            router.push('/login')
        }

        return Promise.reject(err)
    })
    export default http
> 路由访问限制

    在路由中添加：
    路由中的mate ispublic是否真且token是否存在，真的话公开访问，不然就跳转到登录页面
    router.beforeEach((to,from,next)=>{
    if(to.meta.ispublic&&sessionStorage.token){
        return next('/login')
    }
    next()
    })

    公开的路由
    {
    path: '/login',
    name: 'login',
    component: Login,
    meta:{
      ispublic:true
    }}
    访问受限制
      {
    path: '/',
    name: 'HelloWorld',
    component: HelloWorld,
    redirect: "/acticalist",
    children: [
      {
        path: '/acticalist',
        name: 'Acticalist',
        component: () => import( '../views/Acticalist.vue')
      },]
    }

