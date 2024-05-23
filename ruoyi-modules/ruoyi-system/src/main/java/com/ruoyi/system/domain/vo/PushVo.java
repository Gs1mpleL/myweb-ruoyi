package com.ruoyi.system.domain.vo;

import lombok.Data;

@Data
public class PushVo {
    private Long id;
    private Long userId;
    private String type;
    private String token;
}
