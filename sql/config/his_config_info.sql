create table his_config_info
(
    id                 bigint unsigned                        not null,
    nid                bigint unsigned auto_increment
        primary key,
    data_id            varchar(255)                           not null,
    group_id           varchar(128)                           not null,
    app_name           varchar(128)                           null comment 'app_name',
    content            longtext                               not null,
    md5                varchar(32)                            null,
    gmt_create         datetime     default CURRENT_TIMESTAMP not null,
    gmt_modified       datetime     default CURRENT_TIMESTAMP not null,
    src_user           text                                   null,
    src_ip             varchar(50)                            null,
    op_type            char(10)                               null,
    tenant_id          varchar(128) default ''                null comment '租户字段',
    encrypted_data_key text                                   null comment '秘钥'
)
    comment '多租户改造' collate = utf8mb3_bin;

create index idx_did
    on his_config_info (data_id);

create index idx_gmt_create
    on his_config_info (gmt_create);

create index idx_gmt_modified
    on his_config_info (gmt_modified);

INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (2, 1, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:
  redis:
    host: localhost
    port: 6379
    password:
  cloud:
    gateway:
      discovery:
        locator:
          lowerCaseServiceId: true
          enabled: true
      routes:
        # 认证中心
        - id: ruoyi-auth
          uri: lb://ruoyi-auth
          predicates:
            - Path=/auth/**
          filters:
            # 验证码处理
            - CacheRequestFilter
            - ValidateCodeFilter
            - StripPrefix=1
        # 代码生成
        - id: ruoyi-gen
          uri: lb://ruoyi-gen
          predicates:
            - Path=/code/**
          filters:
            - StripPrefix=1
        # 定时任务
        - id: ruoyi-job
          uri: lb://ruoyi-job
          predicates:
            - Path=/schedule/**
          filters:
            - StripPrefix=1
        # 系统模块
        - id: ruoyi-system
          uri: lb://ruoyi-system
          predicates:
            - Path=/system/**
          filters:
            - StripPrefix=1
        # 文件服务
        - id: ruoyi-file
          uri: lb://ruoyi-file
          predicates:
            - Path=/file/**
          filters:
            - StripPrefix=1

# 安全配置
security:
  # 验证码
  captcha:
    enabled: true
    type: math
  # 防止XSS攻击
  xss:
    enabled: true
    excludeUrls:
      - /system/notice
  # 不校验白名单
  ignore:
    whites:
      - /auth/logout
      - /auth/login
      - /auth/register
      - /*/v2/api-docs
      - /csrf
', '57cec5abd0e0a6b77d853750344a9dc0', '2024-05-05 15:34:36', '2024-05-05 07:34:37', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (4, 2, 'ruoyi-monitor-dev.yml', 'DEFAULT_GROUP', '', '# spring
spring:
  security:
    user:
      name: ruoyi
      password: 123456
  boot:
    admin:
      ui:
        title: 若依服务状态监控
', '6f122fd2bfb8d45f858e7d6529a9cd44', '2024-05-05 15:49:35', '2024-05-05 07:49:35', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (0, 3, 'ruoyi-myweb-crawler-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.system
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', '00678c89684ec0b825cb9b71e032db64', '2024-05-06 10:10:29', '2024-05-06 02:10:30', null, '192.168.65.1', 'I', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (12, 4, 'ruoyi-myweb-crawler-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.system
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', '00678c89684ec0b825cb9b71e032db64', '2024-05-06 10:11:58', '2024-05-06 02:11:58', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (12, 5, 'ruoyi-myweb-crawler-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.myweb.crawler
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', 'd6498dbd8d5d00248ae516122c57e2f4', '2024-05-06 10:13:55', '2024-05-06 02:13:56', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (0, 6, 'ruoyi-myweb-crawler.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.myweb.crawler
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', 'd6498dbd8d5d00248ae516122c57e2f4', '2024-05-06 10:23:52', '2024-05-06 02:23:53', null, '192.168.65.1', 'I', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (15, 7, 'ruoyi-myweb-crawler.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.myweb.crawler
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', 'd6498dbd8d5d00248ae516122c57e2f4', '2024-05-06 10:25:19', '2024-05-06 02:25:20', null, '192.168.65.1', 'D', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (0, 8, 'ruoyi-crawler-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.myweb.crawler
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', 'd6498dbd8d5d00248ae516122c57e2f4', '2024-05-06 10:38:09', '2024-05-06 02:38:10', null, '192.168.65.1', 'I', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (12, 9, 'ruoyi-myweb-crawler-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.myweb.crawler
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', 'd6498dbd8d5d00248ae516122c57e2f4', '2024-05-06 10:38:13', '2024-05-06 02:38:13', null, '192.168.65.1', 'D', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (16, 10, 'ruoyi-crawler-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.myweb.crawler
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', 'd6498dbd8d5d00248ae516122c57e2f4', '2024-05-06 10:43:41', '2024-05-06 02:43:41', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (2, 11, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', '', 'spring:
  redis:
    host: localhost
    port: 6379
    password:
  cloud:
    gateway:
      discovery:
        locator:
          lowerCaseServiceId: true
          enabled: true
      routes:
        # 认证中心
        - id: ruoyi-auth
          uri: lb://ruoyi-auth
          predicates:
            - Path=/auth/**
          filters:
            # 验证码处理
            - CacheRequestFilter
            - ValidateCodeFilter
            - StripPrefix=1
        # 代码生成
        - id: ruoyi-gen
          uri: lb://ruoyi-gen
          predicates:
            - Path=/code/**
          filters:
            - StripPrefix=1
        # 定时任务
        - id: ruoyi-job
          uri: lb://ruoyi-job
          predicates:
            - Path=/schedule/**
          filters:
            - StripPrefix=1
        # 系统模块
        - id: ruoyi-system
          uri: lb://ruoyi-system
          predicates:
            - Path=/system/**
          filters:
            - StripPrefix=1
        # 文件服务
        - id: ruoyi-file
          uri: lb://ruoyi-file
          predicates:
            - Path=/file/**
          filters:
            - StripPrefix=1

# 安全配置
security:
  # 验证码
  captcha:
    enabled: false
    type: math
  # 防止XSS攻击
  xss:
    enabled: true
    excludeUrls:
      - /system/notice
  # 不校验白名单
  ignore:
    whites:
      - /auth/logout
      - /auth/login
      - /auth/register
      - /*/v2/api-docs
      - /csrf
', '0aa8792effe95aeb2e34da5b7063ecb7', '2024-05-06 10:53:42', '2024-05-06 02:53:42', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (6, 12, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: password

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.gen.domain
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 代码生成接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip

# 代码生成
gen:
  # 作者
  author: ruoyi
  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool
  packageName: com.ruoyi.system
  # 自动去除表前缀，默认是false
  autoRemovePre: false
  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）
  tablePrefix: sys_
', 'eb592420b3fceae1402881887b8a6a0d', '2024-05-07 10:56:10', '2024-05-07 02:56:10', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (5, 13, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.system
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', '00678c89684ec0b825cb9b71e032db64', '2024-05-07 10:56:39', '2024-05-07 02:56:39', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (7, 14, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password: 
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: password

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.job.domain
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 定时任务接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip
', 'edcf0e3fe13fea07b4ec08b1088f30b3', '2024-05-07 10:59:25', '2024-05-07 02:59:25', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (7, 15, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password: 
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: password

# MyBatis
#mybatis:
#    # 搜索指定包别名
#    typeAliasesPackage: com.syt.**.domain
#    # 配置mapper的扫描，找到所有的mapper.xml映射文件
#    mapperLocations: classpath*:mapper/**/*Mapper.xml
#    # 加载全局的配置文件
#    configLocation: classpath:mybatis/mybatis-config.xml

#mybatis-plus
mybatis-plus:
  mapper-locations: classpath*:mapper/**/*.xml
  #  config-location: classpath:mybatis/mybatis-config.xml
  #实体扫描，多个package用逗号或者分号分隔
  typeAliasesPackage: com.ruoyi.**.domain
  global-config:
    #数据库相关配置
    db-config:
      #主键类型  AUTO:"数据库ID自增", INPUT:"用户输入ID", ID_WORKER:"全局唯一ID (数字类型唯一ID)", UUID:"全局唯一ID UUID";
      id-type: AUTO
      logic-delete-value: -1
      logic-not-delete-value: 0
    banner: false
  #原生配置
  configuration:
    map-underscore-to-camel-case: true
    cache-enabled: false
    call-setters-on-nulls: true
    jdbc-type-for-null: \'null\'

# swagger配置
swagger:
  title: 定时任务接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip
', 'c40a0eb316c69fa9095c7f7051727ff4', '2024-05-07 11:13:22', '2024-05-07 03:13:22', null, '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (6, 16, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: password

# # mybatis配置
# mybatis:
#     # 搜索指定包别名
#     typeAliasesPackage: com.ruoyi.gen.domain
#     # 配置mapper的扫描，找到所有的mapper.xml映射文件
#     mapperLocations: classpath:mapper/**/*.xml
#mybatis-plus
mybatis-plus:
  mapper-locations: classpath*:mapper/**/*.xml
  #  config-location: classpath:mybatis/mybatis-config.xml
  #实体扫描，多个package用逗号或者分号分隔
  typeAliasesPackage: com.ruoyi.**.domain
  global-config:
    #数据库相关配置
    db-config:
      #主键类型  AUTO:"数据库ID自增", INPUT:"用户输入ID", ID_WORKER:"全局唯一ID (数字类型唯一ID)", UUID:"全局唯一ID UUID";
      id-type: AUTO
      logic-delete-value: -1
      logic-not-delete-value: 0
    banner: false
  #原生配置
  configuration:
    map-underscore-to-camel-case: true
    cache-enabled: false
    call-setters-on-nulls: true
    jdbc-type-for-null: \'null\'


# swagger配置
swagger:
  title: 代码生成接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip

# 代码生成
gen:
  # 作者
  author: ruoyi
  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool
  packageName: com.ruoyi.system
  # 自动去除表前缀，默认是false
  autoRemovePre: false
  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）
  tablePrefix: sys_
', 'e0fd9644def93f32fdae27a6558cc19a', '2024-05-07 11:13:31', '2024-05-07 03:13:32', null, '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (5, 17, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
# mybatis:
#     # 搜索指定包别名
#     typeAliasesPackage: com.ruoyi.system
#     # 配置mapper的扫描，找到所有的mapper.xml映射文件
#     mapperLocations: classpath:mapper/**/*.xml
#mybatis-plus
mybatis-plus:
  mapper-locations: classpath*:mapper/**/*.xml
  #  config-location: classpath:mybatis/mybatis-config.xml
  #实体扫描，多个package用逗号或者分号分隔
  typeAliasesPackage: com.ruoyi.**.domain
  global-config:
    #数据库相关配置
    db-config:
      #主键类型  AUTO:"数据库ID自增", INPUT:"用户输入ID", ID_WORKER:"全局唯一ID (数字类型唯一ID)", UUID:"全局唯一ID UUID";
      id-type: AUTO
      logic-delete-value: -1
      logic-not-delete-value: 0
    banner: false
  #原生配置
  configuration:
    map-underscore-to-camel-case: true
    cache-enabled: false
    call-setters-on-nulls: true
    jdbc-type-for-null: \'null\'

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', 'b15f79556116f28f08d098fb6f1dc788', '2024-05-07 11:13:38', '2024-05-07 03:13:39', null, '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (5, 18, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.system
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', '00678c89684ec0b825cb9b71e032db64', '2024-05-07 15:47:08', '2024-05-07 07:47:08', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (5, 19, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# # mybatis配置
# mybatis:
#     # 搜索指定包别名
#     typeAliasesPackage: com.zw.serialnum
#     # 配置mapper的扫描，找到所有的mapper.xml映射文件
#     mapperLocations: classpath:mapper/*.xml
# mybatis-plus配置

mybatis-plus:
    # 搜索指定包别名
    typeAliasesPackage: com.zw.serialnum
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapper-locations: classpath:mapper/**/*.xml


# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', '5b345a0ed5b60742671bad6c3d94aa31', '2024-05-07 15:55:18', '2024-05-07 07:55:19', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (5, 20, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# # mybatis配置
# mybatis:
#     # 搜索指定包别名
#     typeAliasesPackage: com.zw.serialnum
#     # 配置mapper的扫描，找到所有的mapper.xml映射文件
#     mapperLocations: classpath:mapper/*.xml
# mybatis-plus配置

mybatis-plus:
    # 搜索指定包别名
    typeAliasesPackage: com.zw.serialnum
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapper-locations: classpath:mapper/*.xml


# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', '1dac4c86920c28b98a90ff5224e8621f', '2024-05-07 15:57:27', '2024-05-07 07:57:28', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (5, 21, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    druid:
      stat-view-servlet:
        enabled: true
        loginUsername: admin
        loginPassword: 123456
    dynamic:
      druid:
        initial-size: 5
        min-idle: 5
        maxActive: 20
        maxWait: 60000
        connectTimeout: 30000
        socketTimeout: 60000
        timeBetweenEvictionRunsMillis: 60000
        minEvictableIdleTimeMillis: 300000
        validationQuery: SELECT 1 FROM DUAL
        testWhileIdle: true
        testOnBorrow: false
        testOnReturn: false
        poolPreparedStatements: true
        maxPoolPreparedStatementPerConnectionSize: 20
        filters: stat,slf4j
        connectionProperties: druid.stat.mergeSql\\=true;druid.stat.slowSqlMillis\\=5000
      datasource:
          # 主库数据源
          master:
            driver-class-name: com.mysql.cj.jdbc.Driver
            url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
            username: root
            password: password
          # 从库数据源
          # slave:
            # username: 
            # password: 
            # url: 
            # driver-class-name: 

# # mybatis配置
# mybatis:
#     # 搜索指定包别名
#     typeAliasesPackage: com.zw.serialnum
#     # 配置mapper的扫描，找到所有的mapper.xml映射文件
#     mapperLocations: classpath:mapper/*.xml
# mybatis-plus配置

mybatis-plus:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.system
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapper-locations: classpath:mapper/**/*.xml


# swagger配置
swagger:
  title: 系统模块接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip', '576afe862917bcf559169790c2e98f59', '2024-05-07 15:57:59', '2024-05-07 07:58:00', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (6, 22, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password:
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: password

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.gen.domain
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 代码生成接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip

# 代码生成
gen:
  # 作者
  author: ruoyi
  # 默认生成包路径 system 需改成自己的模块名称 如 system monitor tool
  packageName: com.ruoyi.system
  # 自动去除表前缀，默认是false
  autoRemovePre: false
  # 表前缀（生成类名不会包含表前缀，多个用逗号分隔）
  tablePrefix: sys_
', 'eb592420b3fceae1402881887b8a6a0d', '2024-05-07 15:59:15', '2024-05-07 07:59:16', 'nacos', '192.168.65.1', 'U', '', '');
INSERT INTO `ry-config`.his_config_info (id, nid, data_id, group_id, app_name, content, md5, gmt_create, gmt_modified, src_user, src_ip, op_type, tenant_id, encrypted_data_key) VALUES (7, 23, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '', '# spring配置
spring:
  redis:
    host: localhost
    port: 6379
    password: 
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/ry-cloud?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&useSSL=true&serverTimezone=GMT%2B8
    username: root
    password: password

# mybatis配置
mybatis:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.job.domain
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 定时任务接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip
', 'edcf0e3fe13fea07b4ec08b1088f30b3', '2024-05-07 15:59:44', '2024-05-07 07:59:45', 'nacos', '192.168.65.1', 'U', '', '');
