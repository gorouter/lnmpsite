#### MySQL V5.7.18

#### 对于macOS的<docker-compose.yml>处理
```
MySQL:
1. - "127.0.0.1:3306:3306" 改为 "3306:3306"
2. - ./mysql/data:/var/lib/mysql 去掉
```

#### 增加wordpress数据库处理
```
docker exec -it mysql /bin/bash
wpsinit
```
