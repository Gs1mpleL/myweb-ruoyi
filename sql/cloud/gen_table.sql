create table gen_table
(
    table_id          bigint auto_increment comment '编号'
        primary key,
    table_name        varchar(200) default ''     null comment '表名称',
    table_comment     varchar(500) default ''     null comment '表描述',
    sub_table_name    varchar(64)                 null comment '关联子表的表名',
    sub_table_fk_name varchar(64)                 null comment '子表关联的外键名',
    class_name        varchar(100) default ''     null comment '实体类名称',
    tpl_category      varchar(200) default 'crud' null comment '使用的模板（crud单表操作 tree树表操作）',
    tpl_web_type      varchar(30)  default ''     null comment '前端模板类型（element-ui模版 element-plus模版）',
    package_name      varchar(100)                null comment '生成包路径',
    module_name       varchar(30)                 null comment '生成模块名',
    business_name     varchar(30)                 null comment '生成业务名',
    function_name     varchar(50)                 null comment '生成功能名',
    function_author   varchar(50)                 null comment '生成功能作者',
    gen_type          char         default '0'    null comment '生成代码方式（0zip压缩包 1自定义路径）',
    gen_path          varchar(200) default '/'    null comment '生成路径（不填默认项目路径）',
    options           varchar(1000)               null comment '其它生成选项',
    create_by         varchar(64)  default ''     null comment '创建者',
    create_time       datetime                    null comment '创建时间',
    update_by         varchar(64)  default ''     null comment '更新者',
    update_time       datetime                    null comment '更新时间',
    remark            varchar(500)                null comment '备注'
)
    comment '代码生成业务表';

INSERT INTO `ry-cloud`.gen_table (table_id, table_name, table_comment, sub_table_name, sub_table_fk_name, class_name, tpl_category, tpl_web_type, package_name, module_name, business_name, function_name, function_author, gen_type, gen_path, options, create_by, create_time, update_by, update_time, remark) VALUES (3, 'sys_push_config', '推送服务类型', null, null, 'SysPushConfig', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'pushConfig', '推送服务', 'ruoyi', '0', '/', '{"parentMenuId":"1"}', 'admin', '2024-05-08 22:24:35', '', '2024-05-08 22:47:16', null);
