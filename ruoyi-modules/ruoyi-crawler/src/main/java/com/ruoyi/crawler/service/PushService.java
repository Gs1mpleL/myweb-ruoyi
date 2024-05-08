package com.ruoyi.crawler.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.crawler.domain.entity.PushEntity;
import com.ruoyi.crawler.domain.vo.BaseMsgVo;
import com.ruoyi.crawler.domain.vo.PushVo;

import java.util.List;


public interface PushService extends IService<PushEntity> {
    boolean push(BaseMsgVo barkMsgVO);
    boolean saveOrUpdatePushProp(PushVo pushVo);
    List<PushVo> getPushPropByCurUser();
}
