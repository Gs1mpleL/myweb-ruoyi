package com.ruoyi.system.domain.vo;

import lombok.Data;

import java.util.Map;

@Data
public class MsgVo {
    private String type;
    private Map<String,String> data;
}
