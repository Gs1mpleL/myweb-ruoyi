create table sys_push
(
    id      int auto_increment
        primary key,
    user_id int          not null,
    type    varchar(255) not null,
    token   varchar(255) null
);

INSERT INTO `ry-cloud`.sys_push (id, user_id, type, token) VALUES (1, 1, 'bark', '4P5DC6jXnLT6Dsm2n9BENe');
INSERT INTO `ry-cloud`.sys_push (id, user_id, type, token) VALUES (2, 1, 'email', 'test');
