---
title: vue 
---
---
<!--more-->
1.绑定属性: v-bind
2.绑定事件：v-on
3.双向数据：v-mode

#### 组件
    组件之间的数据传递
    1.父传子
      父:  v-bind:传递的值=" "
      子:  props:{
          类型，
          值
        }
    2.子传父
      子: v-on:click="方法"
        methods:{
            方法(){
                this.$emit("事件名","传递的值")
            }
        }
      父: 在父组件中的子标签中监听该自定义事件并添加一个响应该事件的处理方法
      v-on:事件名="处理方法"
      methods:{
          处理方法
      }

#### 局部路由的改变
    在需要改变的地方添加<router-view><router-view>
    路由跳转方法：
        1.<router-link to="路径"><router-link>
        2.methods:{
            方法(){
                this.$router.push({ path:'路径'})
            }
        }
#### 路由传参
    路由中：
    {
      path: "/路径/:参数",
      component: detail,
      name: "detail"
    }
    在需要匹配参数的组件中:  
    created(){
        this.id=this.$route.params.id;
    },
    跳转的方式：
    <router-link :to="{name:'路径', params:{匹配的参数id:i}}">12312</router-link>
#### 使用element-ui
    https://element.eleme.cn/#/zh-CN
#### 网络请求
