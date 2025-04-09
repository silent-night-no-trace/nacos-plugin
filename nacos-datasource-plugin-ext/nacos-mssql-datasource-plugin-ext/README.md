# Nacos数据库 KES-sqlserver适配插件（适配sqlserver模式）

## 一、注意事项

### 1.1、修改数据库配置文件

在application.properties文件中声明kingbase的配置信息：

```properties
spring.datasource.platform=sqlserver
db.url.0=jdbc:kingbase8://127.0.0.1:54321/kingbase
db.user.0=SYSDBA
db.password.0=SYSDBA
db.pool.config.driverClassName=com.kingbase8.Driver
```

### 1.2、表结构初始化
使用KES-sqlserver时在nacos数据库中执行schema/nacos-kingbase-sqlserver.sql文件


### 1.3、 插件使用范围
本插件支持sqlserver数据库和KES-sqlserver数据库
其中KES-sqlserver数据库需要将本插件与naocs-kingbase-datasource-plugin-ext插件一同放入plugins文件夹中使用