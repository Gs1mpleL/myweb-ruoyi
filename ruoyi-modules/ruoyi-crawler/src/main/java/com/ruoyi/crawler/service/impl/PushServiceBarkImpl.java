package com.ruoyi.crawler.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.core.constant.SecurityConstants;
import com.ruoyi.common.core.exception.GlobalException;
import com.ruoyi.common.core.utils.RequestsUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.crawler.domain.entity.PushEntity;
import com.ruoyi.crawler.domain.vo.BarkMsgVO;
import com.ruoyi.crawler.domain.vo.BaseMsgVo;
import com.ruoyi.crawler.domain.vo.PushVo;
import com.ruoyi.crawler.mapper.PushMapper;
import com.ruoyi.crawler.service.PushService;
import com.ruoyi.system.api.RemoteUserService;
import com.ruoyi.system.api.domain.SysPushConfig;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;


@Service
@Slf4j
public class PushServiceBarkImpl extends ServiceImpl<PushMapper, PushEntity> implements PushService {
    @Autowired
    private RemoteUserService remoteUserService;
    @Autowired
    private RequestsUtils requestsUtils;
    @Override
    public boolean push(BaseMsgVo baseMsgVo) {
        PushEntity pushEntity = getEntityByCurUserAndPushType(baseMsgVo.getType());
        if (pushEntity==null){
            throw new GlobalException("请先注册"+baseMsgVo.getType());
        }else {
            if (Objects.equals(baseMsgVo.getType(), "bark")){
                return doPushUsingBark(new BarkMsgVO(baseMsgVo.getTitle(), baseMsgVo.getMsg()),pushEntity);
            }
        }
        return false;
    }

    private PushEntity getEntityByCurUserAndPushType(String type) {
        return this.lambdaQuery().eq(PushEntity::getUserId, SecurityUtils.getUserId()).eq(PushEntity::getType, type).last("limit 1").one();
    }

    @Override
    public boolean saveOrUpdatePushProp(PushVo pushVo) {
        PushEntity pushEntity = getEntityByCurUserAndPushType(pushVo.getType());
        if (pushEntity==null){
            return this.save(new PushEntity(SecurityUtils.getUserId(),pushVo.getType(), pushVo.getToken()));
        }else {
            pushEntity.setType(pushVo.getType());
            pushEntity.setToken(pushVo.getToken());
            return this.updateById(pushEntity);
        }
    }

    @Override
    public List<PushVo> getPushPropByCurUser() {
        LambdaQueryWrapper<PushEntity> pushEntityLambdaQueryWrapper = new LambdaQueryWrapper<>();
        List<PushEntity> list = this.list(pushEntityLambdaQueryWrapper.eq(PushEntity::getUserId,SecurityUtils.getUserId()));
        if (list == null||list.isEmpty()){
            throw new GlobalException("未注册任何推送服务");
        }
        ArrayList<PushVo> pushVos = new ArrayList<>();
        for (PushEntity pushEntity : list) {
            PushVo pushVo = new PushVo();
            BeanUtils.copyProperties(pushEntity,pushVo);
            pushVos.add(pushVo);
        }
        return pushVos;
    }

    private boolean doPushUsingBark(BarkMsgVO barkMsgVO, PushEntity pushEntity) {
        if (barkMsgVO.getMsg() == null || Objects.equals(barkMsgVO.getMsg(), "")) {
            throw new GlobalException("没有内容可以发送");
        }
        Map<String, String> map = getParamsMap(barkMsgVO);
        SysPushConfig barkConfig = (SysPushConfig) remoteUserService.getPushConfigByType("bark", SecurityConstants.INNER).getData();
        JSONObject post = requestsUtils.post(barkConfig.getBaseUrl()+pushEntity.getToken(), map, null);
        if (post.getString("message").equals("success")) {
            return true;
        } else {
            throw new GlobalException("发送失败" + post);
        }
    }

    @NotNull
    private static Map<String, String> getParamsMap(BarkMsgVO barkMsgVO) {
        Map<String, String> map = new HashMap<>();
        map.put("body", barkMsgVO.getMsg());
        if (barkMsgVO.getTitle() != null) {
            map.put("title", barkMsgVO.getTitle());
        }
        if (barkMsgVO.getGroupName() != null) {
            map.put("group", barkMsgVO.getGroupName());
        }
        if (barkMsgVO.getUrl() != null) {
            map.put("url", barkMsgVO.getUrl());
        }
        if (barkMsgVO.getIcon() != null) {
            map.put("icon", barkMsgVO.getIcon());
        } else  {
            map.put("icon", "https://wanfeng-oss.oss-cn-beijing.aliyuncs.com/photos/9bdfc9cc03deddb267edf76f9840f6e7.jpg");
        }
        return map;
    }
}
