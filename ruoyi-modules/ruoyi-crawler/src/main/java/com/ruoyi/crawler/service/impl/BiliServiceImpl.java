package com.ruoyi.crawler.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.exception.GlobalException;

import com.ruoyi.common.core.utils.RequestsUtils;
import com.ruoyi.common.core.utils.StringUtils;

import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.crawler.domain.BiliDataEntity;
import com.ruoyi.crawler.mapper.BiliDataMapper;
import com.ruoyi.crawler.service.BiliService;
import com.ruoyi.crawler.utils.RSAKotlinUtils;
import com.ruoyi.crawler.vo.BiliUserDataVo;
import com.ruoyi.crawler.vo.QRVo;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;


@Service
@Slf4j
public class BiliServiceImpl extends ServiceImpl<BiliDataMapper, BiliDataEntity> implements BiliService {
    @Autowired
    private RequestsUtils requestsUtils;

    private static String getRefreshCsrf(String html) {
        try {
            Document document = Jsoup.parse(html);
            Elements elements = document.select("div[id='1-name']");
            return elements.text();
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new GlobalException("cookie刷新失败");
        }
    }

    @Override
    public BiliUserDataVo getBiliUserDataVoByTotalCookie(String totalCookie) {
        BiliUserDataVo biliUserDataVo = new BiliUserDataVo(totalCookie);
        JSONObject jsonObject = getWithCookie("https://api.bilibili.com/x/web-interface/nav", totalCookie);
        JSONObject object = jsonObject.getJSONObject("data");
        String code = jsonObject.getString("code");
        String SUCCESS = "0";
        if (SUCCESS.equals(code)) {
            /* 用户名 */
            biliUserDataVo.setUname(object.getString("uname"));
            /* 账户的uid */
            biliUserDataVo.setMid(object.getString("mid"));
            /* vip类型 */
            biliUserDataVo.setVipType(object.getString("vipType"));
            /* 硬币数 */
            biliUserDataVo.setMoney(object.getString("money"));
            /* 经验 */
            biliUserDataVo.setCurrentExp(object.getJSONObject("level_info").getString("current_exp"));
            /* 大会员状态 */
            biliUserDataVo.setVipStatus(object.getString("vipStatus"));
            /* 钱包B币卷余额 */
            biliUserDataVo.setCouponBalance(object.getJSONObject("wallet").getString("coupon_balance"));
        } else {
            throw new GlobalException("获取B站用户信息失败");
        }
        return biliUserDataVo;
    }

    @Override
    public BiliUserDataVo getBiliDataVoByCurUser() {
        BiliDataEntity biliDataEntity = getBiliDataEntityByCurUser();
        if (biliDataEntity == null) {
            throw new GlobalException("还未创建B站数据！请使用快速体验或登陆体验完整功能！");
        }
        BiliUserDataVo biliUserDataVo = new BiliUserDataVo();
        if (StringUtils.equals(biliDataEntity.getCookie(), "")) {
            return biliUserDataVo;
        }
        return getBiliUserDataVoByTotalCookie(biliDataEntity.getCookie());
    }

    private BiliDataEntity getBiliDataEntityByCurUser() {
        return this.lambdaQuery().eq(BiliDataEntity::getUserId, SecurityUtils.getUserId()).last("limit 1").one();
    }

    @Override
    public QRVo getQR() {
        JSONObject jsonObject = requestsUtils.get("https://passport.bilibili.com/x/passport-login/web/qrcode/generate", null, null);
        // url返回给前端生成二维码
        String url = jsonObject.getJSONObject("data").getString("url");
        // qrcode_key获取refresh_token时使用
        String qrcode_key = jsonObject.getJSONObject("data").getString("qrcode_key");
        return new QRVo(url, qrcode_key);
    }

    @Override
    public String loginByCheckQr(String qrcode_key) {
        JSONObject jsonObject1 = requestsUtils.getAndGetHeader("https://passport.bilibili.com/x/passport-login/web/qrcode/poll?qrcode_key=" + qrcode_key, null, null);
        if (jsonObject1.getJSONObject("data").getString("code").equals("0")) {
            log.info("扫码登陆成功 [{}],返回refresh_token", jsonObject1);
            String totalCookie = getCookieFromRespHeader(jsonObject1);
            String refreshToken = jsonObject1.getJSONObject("data").getString("refresh_token");
            saveOrUpdateBiliDataByCurUser(totalCookie, refreshToken);
            return "登陆成功";
        } else {
            log.info(String.valueOf(jsonObject1));
            return "未扫码";
        }
    }

    @Override
    public void refreshCookie() {
        BiliDataEntity biliDataEntityByUserId = getBiliDataEntityByCurUser();
        JSONObject isNeedRefresh = getWithCookie("https://passport.bilibili.com/x/passport-login/web/cookie/info", biliDataEntityByUserId.getCookie());
        log.info("开始检查是否需要刷新Cookie:[{}]", isNeedRefresh);
        if (isNeedRefresh.getJSONObject("data").getString("refresh").equals("true")) {
            log.info("需要刷新，开始刷新！");
            doRefresh(biliDataEntityByUserId);
        } else {
            log.info("不需要刷新！");
        }
    }

    void doRefresh(BiliDataEntity biliDataEntityByUserId) {
        HashMap<String, String> header = new HashMap<>();
        header.put("Cookie", biliDataEntityByUserId.getCookie());
        BiliUserDataVo biliUserData = new BiliUserDataVo(biliDataEntityByUserId);
        String refreshCsrf = getRefreshCsrf(requestsUtils.getForHtml("https://www.bilibili.com/correspond/1/" + new RSAKotlinUtils().getCorrespondPath(), null, header));
        if (refreshCsrf.isEmpty()) {
            throw new GlobalException("获取refreshCsrf失败");
        }
        String requestBody = "csrf=" + biliUserData.getBiliJct()
                + "&refresh_csrf=" + refreshCsrf
                + "&source=" + "main_web"
                + "&refresh_token=" + biliUserData.getRefreshToken();
        JSONObject post = requestsUtils.postWithHeader("https://passport.bilibili.com/x/passport-login/web/cookie/refresh?" + requestBody, null, header);
        log.info("Cookie刷新结果[{}]", post);
        String newRefreshToken = post.getJSONObject("data").getString("refresh_token");
        String newCookie = getCookieFromRespHeader(post);
        saveOrUpdateBiliDataByCurUser(newCookie, newRefreshToken);
    }

    private JSONObject getWithCookie(String url, String totalCookie) {
        HashMap<String, String> header = new HashMap<>();
        header.put("Cookie", totalCookie);
        return requestsUtils.get(url, null, header);
    }

    private String getCookieFromRespHeader(JSONObject jsonObject1) {
        JSONArray jsonArray = jsonObject1.getJSONArray("Set-Cookie");
        StringBuilder totalCookieBuilder = new StringBuilder();
        for (Object o : jsonArray) {
            totalCookieBuilder.append(o).append(";");
        }
        return totalCookieBuilder.deleteCharAt(totalCookieBuilder.length() - 1).toString();
    }

    private void saveOrUpdateBiliDataByCurUser(String totalCookie, String refreshToken) {
        BiliDataEntity insertOrUpdateUserEntity = new BiliDataEntity();
        insertOrUpdateUserEntity.setCookie(totalCookie);
        insertOrUpdateUserEntity.setRefreshCookie(refreshToken);
        insertOrUpdateUserEntity.setUserId(SecurityUtils.getUserId());
        BiliDataEntity fromDB = this.lambdaQuery().eq(BiliDataEntity::getUserId, SecurityUtils.getUserId()).one();
        if (fromDB == null) {
            this.save(insertOrUpdateUserEntity);
        } else {
            insertOrUpdateUserEntity.setId(fromDB.getId());
            this.updateById(insertOrUpdateUserEntity);
        }
    }
}
