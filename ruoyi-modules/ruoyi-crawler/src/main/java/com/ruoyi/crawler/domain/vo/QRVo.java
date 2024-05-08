package com.ruoyi.crawler.domain.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QRVo {
    String url;
    // qrcode_key获取refresh_token时使用
    String qrcode_key;
}
