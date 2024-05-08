create table sys_logininfor
(
    info_id     bigint auto_increment comment '访问ID'
        primary key,
    user_name   varchar(50)  default ''  null comment '用户账号',
    ipaddr      varchar(128) default ''  null comment '登录IP地址',
    status      char         default '0' null comment '登录状态（0成功 1失败）',
    msg         varchar(255) default ''  null comment '提示信息',
    access_time datetime                 null comment '访问时间'
)
    comment '系统访问记录';

create index idx_sys_logininfor_lt
    on sys_logininfor (access_time);

create index idx_sys_logininfor_s
    on sys_logininfor (status);

INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (1, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-06 09:36:45');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (2, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-06 09:39:47');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (3, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-06 09:39:49');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (4, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-06 23:34:49');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (5, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-07 01:28:18');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (6, 'wanfeng', '127.0.0.1', '0', '登录成功', '2024-05-07 01:28:27');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (7, 'wanfeng', '127.0.0.1', '0', '退出成功', '2024-05-07 01:28:32');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (8, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-07 01:28:36');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (9, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-07 01:30:33');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (10, 'wanfeng', '127.0.0.1', '0', '登录成功', '2024-05-07 01:30:40');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (11, 'wanfeng', '127.0.0.1', '0', '退出成功', '2024-05-07 01:31:04');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (12, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-07 01:31:08');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (13, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-07 01:34:43');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (14, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-07 01:34:45');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (15, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-07 01:35:30');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (16, 'wanfeng', '127.0.0.1', '0', '登录成功', '2024-05-07 01:35:35');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (17, 'wanfeng', '127.0.0.1', '0', '退出成功', '2024-05-07 01:36:25');
INSERT INTO `ry-cloud`.sys_logininfor (info_id, user_name, ipaddr, status, msg, access_time) VALUES (18, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-07 09:20:00');
