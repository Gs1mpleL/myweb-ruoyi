create table crawler_bili_data
(
    id             int auto_increment
        primary key,
    user_id        int  not null,
    cookie         text null,
    refresh_cookie text null
);

INSERT INTO `ry-cloud`.crawler_bili_data (id, user_id, cookie, refresh_cookie) VALUES (1, 1, 'SESSDATA=e06b86f1%2C1730622592%2C9fd21%2A51CjCG3W3oCtIJnTDScWjeqd4fKeFJQIiOzJmBEjUhCVrtgi0njEUhh1N_UmlGrg7dsaUSVmpJMEdLNFNSN3I1TXZtbkFUSEFPQXU0R1M0LWN4MWJIaEo1WFZHRWQ5SVVWVzlaeXBDUzExU2lGREZLNWZLZnBSRGh2ZC03cHptOVpxUDVfMFF3alN3IIEC; Path=/; Domain=bilibili.com; Expires=Sun, 03 Nov 2024 08:29:52 GMT; HttpOnly; Secure;bili_jct=591df60742ce1fd67ce3a9aad5188f36; Path=/; Domain=bilibili.com; Expires=Sun, 03 Nov 2024 08:29:52 GMT;DedeUserID=287473737; Path=/; Domain=bilibili.com; Expires=Sun, 03 Nov 2024 08:29:52 GMT;DedeUserID__ckMd5=6119bb91868bfa11; Path=/; Domain=bilibili.com; Expires=Sun, 03 Nov 2024 08:29:52 GMT;sid=o4vc4bbn; Path=/; Domain=bilibili.com; Expires=Sun, 03 Nov 2024 08:29:52 GMT', '1bcb28f378b180600ffd327fce70ed51');
INSERT INTO `ry-cloud`.crawler_bili_data (id, user_id, cookie, refresh_cookie) VALUES (2, 100, 'SESSDATA=7599ee64%2C1730568972%2C73e95%2A51CjBrOWtzKeJr7Z74ut8FpO7Qx0UEZifTPazaRYqNc17UJZZU_MmHMDBY8NxfcviCC0wSVnlBMmxSRk9YRzh1dXJtdTY0UGg2S21LMmx0RjQ5VmlGMmdVeEp2UXl2STZac2V1cUd2MzU0c3lYa09uTWxvbDFfdzU4VlQ3eFF1LWV3OUx0MUoyQW9nIIEC; Path=/; Domain=bilibili.com; Expires=Sat, 02 Nov 2024 17:36:12 GMT; HttpOnly; Secure;bili_jct=7565b00c0c9d5b71ddc87900ef56136b; Path=/; Domain=bilibili.com; Expires=Sat, 02 Nov 2024 17:36:12 GMT;DedeUserID=287473737; Path=/; Domain=bilibili.com; Expires=Sat, 02 Nov 2024 17:36:12 GMT;DedeUserID__ckMd5=6119bb91868bfa11; Path=/; Domain=bilibili.com; Expires=Sat, 02 Nov 2024 17:36:12 GMT;sid=h0n8f7p4; Path=/; Domain=bilibili.com; Expires=Sat, 02 Nov 2024 17:36:12 GMT', '2ad36764a077834f2501fb4fb7b0bc51');
