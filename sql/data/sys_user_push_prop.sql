create table sys_user_push_prop
(
    id       int auto_increment
        primary key,
    user_id  int          not null,
    base_url varchar(255) not null,
    icon     varchar(255) null
);

