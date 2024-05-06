package com.ruoyi.crawler.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 【请填写功能名称】对象 crawler_bili_info
 *
 * @author ruoyi
 */
@Data
@TableName("crawler_bili_data")
public class BiliDataEntity {
    @TableId(value = "id", type = IdType.AUTO)
    private int id;
    private String userId;
    private String cookie;
    private String refreshCookie;

}
