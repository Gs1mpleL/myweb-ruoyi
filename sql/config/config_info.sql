create table config_info
(
    id                 bigint auto_increment comment 'id'
        primary key,
    data_id            varchar(255)                           not null comment 'data_id',
    group_id           varchar(255)                           null,
    content            longtext                               not null comment 'content',
    md5                varchar(32)                            null comment 'md5',
    gmt_create         datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified       datetime     default CURRENT_TIMESTAMP not null comment '修改时间',
    src_user           text                                   null comment 'source user',
    src_ip             varchar(50)                            null comment 'source ip',
    app_name           varchar(128)                           null,
    tenant_id          varchar(128) default ''                null comment '租户字段',
    c_desc             varchar(256)                           null,
    c_use              varchar(64)                            null,
    effect             varchar(64)                            null,
    type               varchar(64)                            null,
    c_schema           text                                   null,
    encrypted_data_key text                                   null comment '秘钥',
    constraint uk_configinfo_datagrouptenant
        unique (data_id, group_id, tenant_id)
)
    comment 'config_info' collate = utf8mb3_bin;

INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (1, 'application-dev.yml', 'DEFAULT_GROUP', 'spring:
  autoconfigure:
    exclude: com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure
  mvc:
    pathmatch:
      matching-strategy: ant_path_matcher

# feign 配置
feign:
  sentinel:
    enabled: true
  okhttp:
    enabled: true
  httpclient:
    enabled: false
  client:
    config:
      default:
        connectTimeout: 10000
        readTimeout: 10000
  compression:
    request:
      enabled: true
      min-request-size: 8192
    response:
      enabled: true

# 暴露监控端点
management:
  endpoints:
    web:
      exposure:
        include: \'*\'
', '58dde4e3760499d3bac2d77a3a1e9018', '2020-05-20 12:00:00', '2023-12-04 08:08:23', 'nacos', '0:0:0:0:0:0:0:1', '', '', '通用配置', 'null', 'null', 'yaml', '', '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (2, 'ruoyi-gateway-dev.yml', 'DEFAULT_GROUP', 'spring:
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
        # 爬虫模块
        - id: ruoyi-crawler
          uri: lb://ruoyi-crawler
          predicates:
            - Path=/crawler/**
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
', '149ea82c3ad652afabf7cb6757389db6', '2020-05-14 14:17:55', '2024-05-06 02:53:42', 'nacos', '192.168.65.1', '', '', '网关模块', 'null', 'null', 'yaml', '', '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (3, 'ruoyi-auth-dev.yml', 'DEFAULT_GROUP', 'spring:
  redis:
    host: localhost
    port: 6379
    password:
', '8bd9dada9a94822feeab40de55efced6', '2020-11-20 00:00:00', '2022-09-29 02:48:42', 'nacos', '0:0:0:0:0:0:0:1', '', '', '认证中心', 'null', 'null', 'yaml', '', '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (4, 'ruoyi-monitor-dev.yml', 'DEFAULT_GROUP', '# spring
spring:
  security:
    user:
      name: wanfeng
      password: liuzhuohao123
  boot:
    admin:
      ui:
        title: 若依服务状态监控
', 'f5daa62838137b6919f762856db480ca', '2020-11-20 00:00:00', '2024-05-05 07:49:35', 'nacos', '192.168.65.1', '', '', '监控中心', 'null', 'null', 'yaml', '', '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (5, 'ruoyi-system-dev.yml', 'DEFAULT_GROUP', '# spring配置
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
#     typeAliasesPackage: com.ruoyi.system
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
  licenseUrl: https://ruoyi.vip', '6fe3fbb278d1f80deadab9bd35bab895', '2020-11-20 00:00:00', '2024-05-07 07:58:00', 'nacos', '192.168.65.1', '', '', '', '', '', 'text', '', '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (6, 'ruoyi-gen-dev.yml', 'DEFAULT_GROUP', '# spring配置
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
#     typeAliasesPackage: com.ruoyi.system
#     # 配置mapper的扫描，找到所有的mapper.xml映射文件
#     mapperLocations: classpath:mapper/*.xml
# mybatis-plus配置

mybatis-plus:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.gen
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapper-locations: classpath:mapper/**/*.xml


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
', '1c8b84b13a4203cd2ac40323de5cb063', '2020-11-20 00:00:00', '2024-05-07 07:59:16', 'nacos', '192.168.65.1', '', '', '', '', '', 'text', '', '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (7, 'ruoyi-job-dev.yml', 'DEFAULT_GROUP', '# spring配置
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
#     typeAliasesPackage: com.ruoyi.system
#     # 配置mapper的扫描，找到所有的mapper.xml映射文件
#     mapperLocations: classpath:mapper/*.xml
# mybatis-plus配置

mybatis-plus:
    # 搜索指定包别名
    typeAliasesPackage: com.ruoyi.job
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapper-locations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 定时任务接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip
', 'a05075a7a9abb9c4af46cc133f3f1602', '2020-11-20 00:00:00', '2024-05-07 07:59:45', 'nacos', '192.168.65.1', '', '', '', '', '', 'text', '', '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (8, 'ruoyi-file-dev.yml', 'DEFAULT_GROUP', '# 本地文件上传    
file:
    domain: http://127.0.0.1:9300
    path: D:/ruoyi/uploadPath
    prefix: /statics

# FastDFS配置
fdfs:
  domain: http://8.129.231.12
  soTimeout: 3000
  connectTimeout: 2000
  trackerList: 8.129.231.12:22122

# Minio配置
minio:
  url: http://8.129.231.12:9000
  accessKey: minioadmin
  secretKey: minioadmin
  bucketName: test', '5382b93f3d8059d6068c0501fdd41195', '2020-11-20 00:00:00', '2020-12-21 21:01:59', null, '0:0:0:0:0:0:0:1', '', '', '文件服务', 'null', 'null', 'yaml', null, '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (9, 'sentinel-ruoyi-gateway', 'DEFAULT_GROUP', '[
    {
        "resource": "ruoyi-auth",
        "count": 500,
        "grade": 1,
        "limitApp": "default",
        "strategy": 0,
        "controlBehavior": 0
    },
	{
        "resource": "ruoyi-system",
        "count": 1000,
        "grade": 1,
        "limitApp": "default",
        "strategy": 0,
        "controlBehavior": 0
    },
	{
        "resource": "ruoyi-gen",
        "count": 200,
        "grade": 1,
        "limitApp": "default",
        "strategy": 0,
        "controlBehavior": 0
    },
	{
        "resource": "ruoyi-job",
        "count": 300,
        "grade": 1,
        "limitApp": "default",
        "strategy": 0,
        "controlBehavior": 0
    }
]', '9f3a3069261598f74220bc47958ec252', '2020-11-20 00:00:00', '2020-11-20 00:00:00', null, '0:0:0:0:0:0:0:1', '', '', '限流策略', 'null', 'null', 'json', null, '');
INSERT INTO `ry-config`.config_info (id, data_id, group_id, content, md5, gmt_create, gmt_modified, src_user, src_ip, app_name, tenant_id, c_desc, c_use, effect, type, c_schema, encrypted_data_key) VALUES (16, 'ruoyi-crawler-dev.yml', 'DEFAULT_GROUP', '# spring配置
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
    typeAliasesPackage: com.ruoyi.crawler.domain
    # 配置mapper的扫描，找到所有的mapper.xml映射文件
    mapperLocations: classpath:mapper/**/*.xml

# swagger配置
swagger:
  title: 代码生成接口文档
  license: Powered By ruoyi
  licenseUrl: https://ruoyi.vip

', 'c24ed22757dcfec5baefb5776d631414', '2024-05-06 02:38:10', '2024-05-06 02:43:41', 'nacos', '192.168.65.1', '', '', '爬虫模块', '', '', 'yaml', '', '');
