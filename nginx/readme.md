#### 若要使用https，在ssl文件夹中添加自己申请的两个证书文件
```
ssl/nginx.pem
ssl/nginx.key
```

#### 增加对 [wordpress](https://wordpress.org) 支持

>1. 对数据库进行初始化执行: [wpsinit](https://github.com/gorouter/src_dockerfile/tree/master/lnmpsite-docker/mysql)
>2. 可从[官方](https://cn.wordpress.org/wordpress-4.9.4-zh_CN.tar.gz)下载最新版
>   **tar zxvf wordpress-4.9.4-zh_CN.tar.gz**
>3. 解压后放于www目录下
