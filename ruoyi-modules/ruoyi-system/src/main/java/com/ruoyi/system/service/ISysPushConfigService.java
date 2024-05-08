package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.system.api.domain.SysPushConfig;

/**
 * 推送服务Service接口
 *
 * @author ruoyi
 * @date 2024-05-08
 */
public interface ISysPushConfigService {
    /**
     * 查询推送服务
     *
     * @param id 推送服务主键
     * @return 推送服务
     */
        SysPushConfig selectSysPushConfigById(Long id);

    /**
     * 查询推送服务列表
     *
     * @param sysPushConfig 推送服务
     * @return 推送服务集合
     */
    List<SysPushConfig> selectSysPushConfigList(SysPushConfig sysPushConfig);

    /**
     * 新增推送服务
     *
     * @param sysPushConfig 推送服务
     * @return 结果
     */
    int insertSysPushConfig(SysPushConfig sysPushConfig);

    /**
     * 修改推送服务
     *
     * @param sysPushConfig 推送服务
     * @return 结果
     */
    int updateSysPushConfig(SysPushConfig sysPushConfig);

    /**
     * 批量删除推送服务
     *
     * @param ids 需要删除的推送服务主键集合
     * @return 结果
     */
    int deleteSysPushConfigByIds(Long[] ids);

    /**
     * 删除推送服务信息
     *
     * @param id 推送服务主键
     * @return 结果
     */
    int deleteSysPushConfigById(Long id);

    SysPushConfig getByType(String type);
}
