package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysPushConfigMapper;
import com.ruoyi.system.domain.SysPushConfig;
import com.ruoyi.system.service.ISysPushConfigService;

/**
 * 推送服务Service业务层处理
 *
 * @author ruoyi
 * @date 2024-05-08
 */
@Service
public class SysPushConfigServiceImpl implements ISysPushConfigService {
    @Autowired
    private SysPushConfigMapper sysPushConfigMapper;

    /**
     * 查询推送服务
     *
     * @param id 推送服务主键
     * @return 推送服务
     */
    @Override
    public SysPushConfig selectSysPushConfigById(Long id) {
        return sysPushConfigMapper.selectSysPushConfigById(id);
    }

    /**
     * 查询推送服务列表
     *
     * @param sysPushConfig 推送服务
     * @return 推送服务
     */
    @Override
    public List<SysPushConfig> selectSysPushConfigList(SysPushConfig sysPushConfig) {
        return sysPushConfigMapper.selectSysPushConfigList(sysPushConfig);
    }

    /**
     * 新增推送服务
     *
     * @param sysPushConfig 推送服务
     * @return 结果
     */
    @Override
    public int insertSysPushConfig(SysPushConfig sysPushConfig) {
            return sysPushConfigMapper.insertSysPushConfig(sysPushConfig);
    }

    /**
     * 修改推送服务
     *
     * @param sysPushConfig 推送服务
     * @return 结果
     */
    @Override
    public int updateSysPushConfig(SysPushConfig sysPushConfig) {
        return sysPushConfigMapper.updateSysPushConfig(sysPushConfig);
    }

    /**
     * 批量删除推送服务
     *
     * @param ids 需要删除的推送服务主键
     * @return 结果
     */
    @Override
    public int deleteSysPushConfigByIds(Long[] ids) {
        return sysPushConfigMapper.deleteSysPushConfigByIds(ids);
    }

    /**
     * 删除推送服务信息
     *
     * @param id 推送服务主键
     * @return 结果
     */
    @Override
    public int deleteSysPushConfigById(Long id) {
        return sysPushConfigMapper.deleteSysPushConfigById(id);
    }
}
