# 1.Nacos数据库 KES-sqlserver适配插件（适配sqlserver模式）

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

# 2.SQL Server数据库使用说明（适配原生 SQL Server）
### 2.1、修改数据库配置文件
   在 application.properties 文件中声明 SQL Server 的配置信息：

```properties
spring.datasource.platform=sqlserver
db.url.0=jdbc:sqlserver://127.0.0.1:1433;databaseName=nacos_config
db.user.0=your_user
db.password.0=your_password
db.pool.config.driverClassName=com.microsoft.sqlserver.jdbc.SQLServerDriver
```

### 2.2、表结构初始化
使用 SQL Server 数据库时，在 nacos_config 数据库中执行schema/nacos-mssql.sql
该脚本已适配 SQL Server 的语法，可直接用于初始化数据表

### 2.3、插件使用范围
本插件支持SQL Server 数据库与KES-sqlserver 数据库
其中使用 SQL Server 数据库时，也需将本插件文件放入 Nacos 安装目录的 plugins： nacos-mssql-datasource-plugin-ext.jar


