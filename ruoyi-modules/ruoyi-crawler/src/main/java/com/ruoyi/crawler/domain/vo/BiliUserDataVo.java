package com.ruoyi.crawler.domain.vo;


import com.ruoyi.common.core.exception.GlobalException;
import com.ruoyi.crawler.domain.entity.BiliDataEntity;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 用户的一些个人信息
 */
@Data
@NoArgsConstructor
public class BiliUserDataVo {
    public static final String BILI_USER_DATA = "biliUserData";
    /** 登录账户的用户名 */
    private String uname;
    /** 登录账户的uid */
    private String mid;
    /** 代表账户的类型 */
    private String vipType;
    /** 硬币数 */
    private String money;
    /** 经验数 */
    private String currentExp;
    /** 大会员状态 */
    private String vipStatus;
    /** B币卷余额 */
    private String couponBalance;
    /** 认证 **/
    private String totalCookie;
    private String biliJct;
    private String refreshToken;

    /**
     * token可刷新
     */
    public BiliUserDataVo(BiliDataEntity biliDataEntity) {
        this.totalCookie = biliDataEntity.getCookie();
        setCookie(this.totalCookie);
        this.refreshToken = biliDataEntity.getRefreshCookie();
    }

    /**
     * 只设置cookie，不能刷新token
     */
    public BiliUserDataVo(String totalCookieFromWeb) {
        totalCookie = totalCookieFromWeb;
        setCookie(totalCookieFromWeb);
    }

    public void setCookie(String totalCookie) {
        String regStr = "bili_jct=(.*?); ";
        Pattern pattern = Pattern.compile(regStr);
        Matcher matcher = pattern.matcher(totalCookie);
        if (matcher.find()) {
            this.biliJct = matcher.group(0).replace("bili_jct=", "").replace("; ", "");
        } else {
            throw new GlobalException("cookie解析失败");
        }
    }

}
