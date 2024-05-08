package com.ruoyi.crawler.domain.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("crawler_push")
public class PushEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private Long userId;
    private String  type;
    private String token;

    public PushEntity(Long userId, String type, String token) {
        this.userId = userId;
        this.type = type;
        this.token = token;
    }
}
