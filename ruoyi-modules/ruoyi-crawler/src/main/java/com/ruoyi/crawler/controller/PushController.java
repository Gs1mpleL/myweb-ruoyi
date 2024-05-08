package com.ruoyi.crawler.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.crawler.domain.vo.BaseMsgVo;
import com.ruoyi.crawler.domain.vo.PushVo;
import com.ruoyi.crawler.service.PushService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/push")
public class PushController {
    @Autowired
    private PushService pushService;
    @GetMapping("/getPushProp")
    public R<?> getPushProp(){
        return R.ok(pushService.getPushPropByCurUser());
    }

    @PostMapping("/saveOrUpdate")
    public R<?> saveOrUpdatePushProp(@RequestBody PushVo pushVo){
        return R.ok(pushService.saveOrUpdatePushProp(pushVo));
    }

    @PostMapping("/doPush")
    public R<?> saveOrUpdatePushProp(@RequestBody BaseMsgVo baseMsgVo){
        return R.ok(pushService.push(baseMsgVo));
    }
}
