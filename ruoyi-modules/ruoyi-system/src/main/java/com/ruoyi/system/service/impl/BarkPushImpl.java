package com.ruoyi.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.core.exception.GlobalException;
import com.ruoyi.common.core.utils.RequestUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.domain.SysPushEntity;
import com.ruoyi.system.domain.vo.MsgVo;
import com.ruoyi.system.service.ISysPushService;
import com.ruoyi.system.service.Push;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bark")
public class BarkPushImpl implements Push {
    @Autowired
    private RequestUtils requestUtils;
    @Autowired
    private ISysPushService iSysPushService;
    @Override
    public boolean push(MsgVo msgVo) {
        SysPushEntity sysPushEntity = iSysPushService.lambdaQuery().eq(SysPushEntity::getType, msgVo.getType()).eq(SysPushEntity::getUserId, SecurityUtils.getUserId()).last("limit 1").one();
        return doPushUsingBark(msgVo,sysPushEntity.getToken());
    }
    private boolean doPushUsingBark(MsgVo msgVO, String token) {
        if (msgVO.getData() == null || msgVO.getData().get("body")==null) {
            throw new GlobalException("无消息可以发送");
        }
        msgVO.getData().putIfAbsent("icon", "https://wanfeng-oss.oss-cn-beijing.aliyuncs.com/photos/9bdfc9cc03deddb267edf76f9840f6e7.jpg");
        JSONObject post = requestUtils.post("https://api.day.app/"+token, msgVO.getData(), null);
        if (post.getString("message").equals("success")) {
            return true;
        } else {
            throw new GlobalException("发送失败" + post);
        }
    }
}
