package com.ruoyi.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.system.domain.SysPushEntity;
import com.ruoyi.system.domain.vo.MsgVo;
import com.ruoyi.system.domain.vo.PushVo;

import java.util.List;


public interface ISysPushService extends IService<SysPushEntity> {
    boolean doPush(MsgVo msgVo);
    List<PushVo> getPushConfigByCurUser();
    boolean saveOrUpdateConfig(PushVo pushVo);
}
