# Nacos数据库 Kinbase适配插件（适配oracle和mysql模式）

## 一、注意事项

### 1.1、修改数据库配置文件

在application.properties文件中声明kingbase的配置信息：

```properties
spring.datasource.platform=kingbase
db.url.0=jdbc:kingbase8://127.0.0.1:54321/kingbase
db.user.0=SYSDBA
db.password.0=SYSDBA
db.pool.config.driverClassName=com.kingbase8.Driver
```

### 1.2、增加kingbase数据库驱动


```xml
<dependency>
    <groupId>cn.com.kingbase</groupId>
    <artifactId>kingbase8</artifactId>
    <version>8.6.0</version>
</dependency>
```

### 1.3、表结构初始化

使用KES-mysql时在nacos数据库中执行schema/nacos-kingbase-mysql.sql文件
使用KES-oracle时在nacos数据库中执行schema/nacos-kingbase-oracle.sql文件
````