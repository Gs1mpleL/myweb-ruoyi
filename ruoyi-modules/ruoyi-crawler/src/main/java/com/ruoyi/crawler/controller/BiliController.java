package com.ruoyi.crawler.controller;

import com.ruoyi.common.core.domain.R;
import com.ruoyi.crawler.service.BiliService;
import com.ruoyi.crawler.domain.vo.BiliUserDataVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bili")
public class BiliController {
    @Autowired
    private BiliService biliService;

    @GetMapping("/getBiliDataByUserId")
    public R<?> getBiliDataByUserId() {
        BiliUserDataVo biliUserDataVo = biliService.getBiliDataVoByCurUser();
        return R.ok(biliUserDataVo);
    }

    @GetMapping("/quickTest")
    public R<?> quickTest(String totalCookie) {
        BiliUserDataVo biliUserDataVo = biliService.getBiliUserDataVoByTotalCookie(totalCookie);
        return R.ok(biliUserDataVo);
    }

    @GetMapping("/getQR")
    public R<?> getQR() {
        return R.ok(biliService.getQR());
    }

    @GetMapping("/loginByCheckQr/{qrcode_key}")
    public R<?> loginByCheckQr(@PathVariable String qrcode_key) {
        String refreshTokenFromQRRes = biliService.loginByCheckQr(qrcode_key);
        return R.ok(refreshTokenFromQRRes);
    }

    @GetMapping("/refreshCookie")
    public R<?> refreshCookie() {
        biliService.refreshCookie();
        return R.ok();
    }

}
