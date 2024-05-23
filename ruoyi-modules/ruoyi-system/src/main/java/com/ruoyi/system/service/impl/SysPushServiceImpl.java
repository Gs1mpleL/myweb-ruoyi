package com.ruoyi.system.service.impl;

import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.utils.RequestUtils;
import com.ruoyi.common.core.utils.SpringUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.domain.SysPushEntity;
import com.ruoyi.system.domain.vo.MsgVo;
import com.ruoyi.system.domain.vo.PushVo;
import com.ruoyi.system.mapper.SysPushMapper;
import com.ruoyi.system.service.ISysPushService;
import com.ruoyi.system.service.Push;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class SysPushServiceImpl extends ServiceImpl<SysPushMapper, SysPushEntity> implements ISysPushService {
    @Autowired
    private RequestUtils requestUtils;

    @Override
    public boolean doPush(MsgVo msgVo) {
        Push pushService = (Push) SpringUtils.getBean(msgVo.getType());
        return pushService.push(msgVo);
    }

    @Override
    public List<PushVo> getPushConfigByCurUser() {
        List<SysPushEntity> list = this.lambdaQuery().eq(SysPushEntity::getUserId, SecurityUtils.getUserId()).list();
        ArrayList<PushVo> pushVos = new ArrayList<>();
        for (SysPushEntity sysPushEntity : list) {
            PushVo pushVo = new PushVo();
            BeanUtils.copyProperties(sysPushEntity,pushVo);
            pushVos.add(pushVo);
        }
        return pushVos;
    }

    @Override
    public boolean saveOrUpdateConfig(PushVo pushVo) {
        SysPushEntity sysPushEntity = new SysPushEntity();
        BeanUtils.copyProperties(pushVo,sysPushEntity);
        if (sysPushEntity.getId() == null){
            return this.save(sysPushEntity);
        }else {
            return this.updateById(sysPushEntity);
        }
    }
}
