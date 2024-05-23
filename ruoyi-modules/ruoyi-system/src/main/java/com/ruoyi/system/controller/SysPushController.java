package com.ruoyi.system.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.system.domain.vo.MsgVo;
import com.ruoyi.system.domain.vo.PushVo;
import com.ruoyi.system.service.ISysPushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/push")
public class SysPushController {
    @Autowired
    ISysPushService pushService;
    @PostMapping("/doPush")
    public R<?> doPush(@RequestBody MsgVo msgVo){
        boolean b = pushService.doPush(msgVo);
        return b?R.ok(true):R.fail(false);
    }
    @GetMapping("/getPushConfig")
    public R<List<PushVo>> getPushConfigByCurUser(){
        return R.ok(pushService.getPushConfigByCurUser());
    }

    @PostMapping("/saveOrUpdateConfig")
    public R<?> saveOrUpdateConfig(@RequestBody PushVo pushVo){
        return R.ok(pushService.saveOrUpdateConfig(pushVo));
    }
}
