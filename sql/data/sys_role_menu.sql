create table sys_role_menu
(
    role_id bigint not null comment '角色ID',
    menu_id bigint not null comment '菜单ID',
    primary key (role_id, menu_id)
)
    comment '角色和菜单关联表';

INSERT INTO `ry-cloud`.sys_role_menu (role_id, menu_id) VALUES (100, 4);
INSERT INTO `ry-cloud`.sys_role_menu (role_id, menu_id) VALUES (100, 2000);
INSERT INTO `ry-cloud`.sys_role_menu (role_id, menu_id) VALUES (100, 2001);
INSERT INTO `ry-cloud`.sys_role_menu (role_id, menu_id) VALUES (100, 2002);
