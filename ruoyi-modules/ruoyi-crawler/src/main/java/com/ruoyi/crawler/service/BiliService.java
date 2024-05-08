package com.ruoyi.crawler.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.crawler.domain.entity.BiliDataEntity;
import com.ruoyi.crawler.domain.vo.BiliUserDataVo;
import com.ruoyi.crawler.domain.vo.QRVo;


public interface BiliService extends IService<BiliDataEntity> {
    BiliUserDataVo getBiliUserDataVoByTotalCookie(String totalCookie);

    BiliUserDataVo getBiliDataVoByCurUser();

    QRVo getQR();

    String loginByCheckQr(String qrcode_key);

    void refreshCookie();
}
