package com.ruoyi.crawler.domain.vo;

import lombok.Data;

@Data
public class PushVo {
    private Long id;
    private Long userId;
    private String token;
    private String type;
}
